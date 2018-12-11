# SuDokuR
Solving Sudoku with R ([Euler Problem 96](https://projecteuler.net/problem=96)).

## Prerequisities

I have used:

* R in version 3.5.1
* [R Suite](https://rsuite.io) in version 0.33-246

## Remark for Windows users ##

Instalation of the packages requires [Rtools](https://cran.r-project.org/bin/windows/Rtools/) compatible with your R version.

## Usage instruction ##

### Prepare project ###

Install dependencies for the project

```
rsuite proj depsinst
```

Build custom packages

```
rsuite proj build
```

### Run solver ###

In folder `data` there is a file `p096_sudoku.txt` with 50 SuDoku's tables. To solve all of them you have to call the following command:

```
Rscript R/solve.R
```

The command must be run in a project folder. 

The results are exported into `export` directory.
