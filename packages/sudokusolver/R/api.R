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
save_results <- function(results, file_path) {
    res <- lapply(results,
                  function(res) {
                      if (res$res == TRUE) {
                          apply(X = results[[1]]$tbl,
                                MARGIN = 1,
                                FUN = function(r) {
                                    paste(r, collapse = "")
                                })
                      }
                  })

    res_file <- file(file_path, open = "wt")
    
    for (i in seq_along(res)) {
        writeLines(text = names(res)[[i]], con = res_file)
        writeLines(text = res[[i]], con = res_file)
    }
    close(res_file)
}

#' @export
solve <- function(tables) {
    lapply(X = tables,
           FUN = function(table) { backtrack(table) })
}
