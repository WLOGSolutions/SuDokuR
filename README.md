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

## For impatient

I have prepared binary deployment packages with [R Suite](https://rsuite.io). To use them you have to download, unzip and run the solver as described above. **You only need R in version 3.5+**

The binary versions:

* [Windows](https://s3.eu-central-1.amazonaws.com/wlog-share/SuDokuR/SuDokuR_win_1.0x.zip)
* [Ubuntu 14.04](https://s3.eu-central-1.amazonaws.com/wlog-share/SuDokuR/SuDokuR_ubuntu14_04_1.0x.zip)
