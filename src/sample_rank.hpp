#ifndef sample_rank_hpp
#define sample_rank_hpp


#include <Rcpp.h>



// This function was originally copied from https://stackoverflow.com/a/47619503/604854
template <typename R, typename VT, typename IT>
std::vector<R> calculate_sparse_rank(VT vec, IT positions, int number_of_zeros,
                                          std::string ties_method, std::string na_handling) {
  int vec_size = vec.size();
  int total_size = vec_size + number_of_zeros;
  std::vector<R> result(total_size,0);
  //sorted index
  std::vector<size_t> indx(vec_size);
  iota(indx.begin(),indx.end(),0);
  sort(indx.begin(),indx.end(),[&vec](int i1, int i2){
    if(Rcpp::NumericVector::is_na(vec[i1])) return false;
    if(Rcpp::NumericVector::is_na(vec[i2])) return true;
    return vec[i1] < vec[i2];
  });

  // rank observed values
  bool left_of_zero = vec[indx[0]] < 0;
  int zero_start_rank = 1;
  for(int n, i=0;i < vec_size; i += n){
    // This n stuff is for resolving ties.
    // https://stackoverflow.com/a/30827731/604854
    n = 1;
    while(i + n < vec_size && vec[indx[i]] == vec[indx[i + n]]){
      ++n;
    }
    if(!left_of_zero){
      for(int k = 0; k < n; ++k){
        if(ties_method == "average"){
          result[positions[indx[i+k]]] = i+number_of_zeros + (n + 1)/2.0;
        }else if(ties_method == "min"){
          result[positions[indx[i+k]]] = i+number_of_zeros + 1;
        }else if(ties_method == "max"){
          result[positions[indx[i+k]]] = i+number_of_zeros + n;
        }else{
          throw std::runtime_error("Unknown argument to ties_method: " + ties_method + ". Can only handle 'average', 'min', and 'max'.");
        }
      }
    }
    if(left_of_zero){
      for(int k = 0; k < n; ++k){
        if(ties_method == "average"){
          result[positions[indx[i+k]]] = i+ (n + 1)/2.0;
        }else if(ties_method == "min"){
          result[positions[indx[i+k]]] = i+ 1;
        }else if(ties_method == "max"){
          result[positions[indx[i+k]]] = i+ n;
        }else{
          throw std::runtime_error("Unknown argument to ties_method: " + ties_method + ". Can only handle 'average', 'min', and 'max'.");
        }
      }
      if(i + n  == vec_size || vec[indx[i + n]] > 0 || Rcpp::NumericVector::is_na(vec[indx[i + n]])){
        left_of_zero = false;
        zero_start_rank = i + n + 1;
      }else{
      }
    }
  }

  std::vector<size_t> zero_pos(number_of_zeros);
  std::vector<size_t> all_indices(total_size);
  iota(all_indices.begin(),all_indices.end(),0);
  std::set_difference(all_indices.begin(), all_indices.end(), positions.begin(), positions.end(), zero_pos.begin());
  for(int zp: zero_pos){
    if(ties_method == "average"){
      result[zp] = (zero_start_rank * 2 - 1 + number_of_zeros) / 2.0;
    }else if(ties_method == "min"){
      result[zp] = zero_start_rank;
    }else if(ties_method == "max"){
      result[zp] = zero_start_rank + number_of_zeros - 1;
    }else{
      throw std::runtime_error("Unknown argument to ties_method: " + ties_method + ". Can only handle 'average', 'min', and 'max'.");
    }
  }
  if(na_handling == "keep"){
    for(int i = 0; i < vec_size; ++i){
      if(Rcpp::NumericVector::is_na(vec[i])){
        result[positions[i]] = NA_REAL;
      }
    }
  }

  return result;
}


#endif /* sample_rank_hpp */
