traduction_prot <- function(codons){
  prot_seq <- paste0(genetic_code[codons], collapse = "")
  return(prot_seq)
}