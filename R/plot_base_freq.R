#' Plot Nucleotide Frequence from Sequence
#'
#' @param seq: sequence of ribonucleotides or desoxirebonucleotides as a string.
#'
#' @returns bar plot with the absolute frequencies (counts) of the input sequence.
#' @export
#'
#' @examples
#' plot_base_seq("AGCTAGCTAGCTCGGTTTCGTAGCTCATGC")
#' plot_base_seq("AUCGAUGGCUAGGCUGUAGCGAUACGUAGCGAUGCUA")
#' 
plot_base_seq <- function(seq){
  # Get list of fundamental nucleotides from seq 
  base_list <- seq |>  
    stringr::str_split(pattern = stringr::boundary("character"), simplify = TRUE) |>
    as.character() |> 
    unique()
  
  # Count nucleotides grouping by nucleotides
  counts <- sapply(base_list, function(amino_acid) stringr::str_count(string = seq, pattern =  amino_acid)) |>  
    as.data.frame()
  
  # Name dataframe rows of previous step
  colnames(counts) <- c("Counts")
  counts[["Nucleotides"]] <- rownames(counts)
  
  # Create a bar plot for the results
  bar_plot <- counts |>  
    ggplot2::ggplot(ggplot2::aes(x = Nucleotides, y = Counts, fill = Nucleotides)) +
    ggplot2::geom_col() +
    ggplot2::theme_bw() +
    ggplot2::theme(legend.position = "none")
  
  return(bar_plot)
}