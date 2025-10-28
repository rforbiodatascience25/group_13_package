create_seq <- function(seq_size){
  seq_list <- sample(c("A", "T", "G", "C"), size = seq_size, replace = TRUE)
  seq_str <- paste0(seq_list, collapse = "")
  return(seq_str)
}
