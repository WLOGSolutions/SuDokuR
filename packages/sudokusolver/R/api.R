#' @export
load_tables <- function(data_file_path) {
    tables_src <- readLines(con = file.path(script_path, "../data/p096_sudoku.txt"))

    tables_headers_idxs <- grep(pattern = "Grid.*", x = tables_src)

    tables <- list()

    for(tidx in tables_headers_idxs) {
        table <- matrix(data = as.numeric(unlist(strsplit(x = tables_src[(tidx+1):(tidx+9)],
                                                          split = ""))),
                        nrow = 9,
                        byrow = TRUE)
        
        tables[[tables_src[tidx]]] <- table
    }

    return(tables)
}

#' @export
solve <- function(tables) {
    lapply(X = tables,
           FUN = function(table) { backtrack(table) })
}
