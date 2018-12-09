# Detect proper script_path (you cannot use args yet as they are build with tools in set_env.r)
script_path <- (function() {
    args <- commandArgs(trailingOnly = FALSE)
    script_path <- dirname(sub("--file=", "", args[grep("--file=", args)]))
    if (!length(script_path)) {
        return("R")
    }
    if (grepl("darwin", R.version$os)) {
        base <- gsub("~\\+~", " ", base) # on MacOS ~+~ in path denotes whitespace
    }
    return(normalizePath(script_path))
})()

# Setting .libPaths() to point to libs folder
source(file.path(script_path, "set_env.R"), chdir = T)

config <- load_config()
args <- args_parser()

tables <- sudokusolver::load_tables(file.path(script_path,
                                              "../data/p096_sudoku.txt"))
loginfo("-> Tables loaded [%d]", length(tables))

system.time(results <- sudokusolver::solve(tables))

loginfo("-> All problems solved [%d]", length(results))

sudokusolver::save_results(results,
                           file.path(script_path, "../export/results.txt"))

loginfo("-> Solutions saved")
