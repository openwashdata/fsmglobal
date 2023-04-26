
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fsmglobal

<!-- badges: start -->
<!-- badges: end -->

## Overview

This data was first published as part of a journal article by (Greene et
al. 2021) and contained in the supplemental material as a table in a
DOCX file.

## Installation

You can install the development version of fsmglobal from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("openwashdata/fsmglobal")
```

Alternatively, you can download the individual datasets as a CSV or XLSX
file from the table below.

| dataset   | CSV                                                                                                        | XLSX                                                                                                         |
|:----------|:-----------------------------------------------------------------------------------------------------------|:-------------------------------------------------------------------------------------------------------------|
| fsmglobal | [Download CSV](https://github.com/Global-Health-Engineering/fsmglobal/raw/main/inst/extdata/fsmglobal.csv) | [Download XLSX](https://github.com/Global-Health-Engineering/fsmglobal/raw/main/inst/extdata/fsmglobal.xlsx) |

## Data

The package provides access to one dataset.

``` r
library(fsmglobal)
```

The `fsmglobal` data set has 9 variables and 700 observations. For an
overview of the variable names, see the following table.

``` r
fsmglobal
```

| variable_name              | variable_type | description                                                                                                    |
|:---------------------------|:--------------|:---------------------------------------------------------------------------------------------------------------|
| iso3c                      | character     | International Standards Organization (ISO) 3-digit alphabetic codes.                                           |
| country                    | character     | Name of the country.                                                                                           |
| emptying_method            | character     | Type of faecal sludge emptying method for corresponding population in `population_emptying_method`.            |
| population_2017            | numeric       | Total country population in 2017.                                                                              |
| population_emptying_method | numeric       | Total population requiring faecal sludge emptying services for type of method identified in `emptying_method`. |
| count_pits_septics         | numeric       | Total number of pit latrines and septic tanks in country.                                                      |
| emptying_demand            | numeric       | Emptying demand as the proportion of `population_emptying_method` / `population_2017`.                         |
| urban_demand               | numeric       | Proportion of urban population.                                                                                |
| rural_demand               | numeric       | Proportion of rural population.                                                                                |

## License

Data are available as
[CC-BY](https://github.com/Global-Health-Engineering/fsmglobal/blob/main/LICENSE.md).

## References

<div id="refs" class="references csl-bib-body hanging-indent">

<div id="ref-greene2021" class="csl-entry">

Greene, Nicola, Sarah Hennessy, Tate W. Rogers, Jocelyn Tsai, and
Francis L. de los Reyes III. 2021. “The Role of Emptying Services in
Provision of Safely Managed Sanitation: A Classification and
Quantification of the Needs of LMICs.” *Journal of Environmental
Management* 290 (July): 112612.
<https://doi.org/10.1016/j.jenvman.2021.112612>.

</div>

</div>
