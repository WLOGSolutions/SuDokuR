find_nonzero <- function(tbl) {
    i <- which(tbl == 0)[1]
    if (!is.na(i)) {
        c((i-1) %% 9  + 1, ((i - 1) %/% 9) + 1)
    } else {
        NULL
    }
}

blockvalid <- function(tbl, v, ix, iy) {
    sum(tbl[ix, iy] == v) <= 1
}

backtrack <- function(tbl) {
    pos <- find_nonzero(tbl)
    if (is.null(pos)) return(list(res = TRUE, tbl = tbl))

    for (k in 1:9) {

        tbl[pos[1], pos[2]] <- k
        if (!blockvalid(tbl, k, pos[1], 1:9)) {
            next
        }

        if (!blockvalid(tbl, k, 1:9, pos[2])) {
            next
        }

        if (!blockvalid(tbl, k,
                        3 * ((pos[1] - 1) %/% 3) + (1:3),
                        3 * ((pos[2] - 1) %/% 3) + (1:3))) {
            next
        }

        res <- backtrack(tbl)
        
        if (res$res) {
            return(res)
        }
    }
    tbl[pos[1], pos[2]]  <- 0
    
    return(list(res = FALSE, tbl = tbl))
}
