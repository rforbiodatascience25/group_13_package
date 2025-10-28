plot_base_seq <- function(seq){
  base_list <- seq |>  
    stringr::str_split(pattern = stringr::boundary("character"), simplify = TRUE) |>
    as.character() |> 
    unique()
  
  counts <- sapply(base_list, function(amino_acid) stringr::str_count(string = seq, pattern =  amino_acid)) |>  
    as.data.frame()
  
  colnames(counts) <- c("Counts")
  counts[["Nucleotides"]] <- rownames(counts)
  
  bar_plot <- counts |>  
    ggplot2::ggplot(ggplot2::aes(x = Nucleotides, y = Counts, fill = Nucleotides)) +
    ggplot2::geom_col() +
    ggplot2::theme_bw() +
    ggplot2::theme(legend.position = "none")
  
  return(bar_plot)
}