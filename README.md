
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fsmglobal

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/577705928.svg)](https://zenodo.org/badge/latestdoi/577705928)
[![R-CMD-check](https://github.com/openwashdata/fsmglobal/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/openwashdata/fsmglobal/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Overview

This data was first published as part of a journal article by (Greene et
al. 2021) and contained in the supplemental material as a table in a
DOCX file.

## Installation

You can install fsmglobal from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("openwashdata/fsmglobal")
```

Alternatively, you can download the individual datasets as a CSV or XLSX
file from the table below.

| dataset   | CSV                                                                                           | XLSX                                                                                            |
|:----------|:----------------------------------------------------------------------------------------------|:------------------------------------------------------------------------------------------------|
| fsmglobal | [Download CSV](https://github.com/openwashdata/fsmglobal/raw/main/inst/extdata/fsmglobal.csv) | [Download XLSX](https://github.com/openwashdata/fsmglobal/raw/main/inst/extdata/fsmglobal.xlsx) |

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

## Examples

The code and table below show a summary for the demand for faecal sludge
emptying services. Find this and more examples in
`vignette("examples")`.

``` r
library(fsmglobal)
library(gt)
library(dplyr)
```

``` r
tbl_emptying_demand_global <- fsmglobal |> 
  group_by(emptying_method) |> 
  summarise(
    sum_population_emptying_method = sum(population_emptying_method)
  ) |> 
  mutate(
    percent = sum_population_emptying_method / 
      sum(sum_population_emptying_method) * 100
  )
```

``` r
tbl_emptying_demand_global |> 
  janitor::adorn_totals() |>
  
  # use gt R package to prepare a table
  gt(rowname_col = "emptying_method") |>
  tab_header(title = md("**Demand for faecal sludge emptying services**"), 
             subtitle = "summarised for 175 countries") |> 
  fmt_number(columns = "sum_population_emptying_method", decimals = 0) |> 
  fmt_percent(columns = "percent", decimals = 0, scale_values = FALSE) |> 
  cols_label(sum_population_emptying_method = "population") 
```

<div id="ccvkgamihp" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#ccvkgamihp table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
&#10;#ccvkgamihp thead, #ccvkgamihp tbody, #ccvkgamihp tfoot, #ccvkgamihp tr, #ccvkgamihp td, #ccvkgamihp th {
  border-style: none;
}
&#10;#ccvkgamihp p {
  margin: 0;
  padding: 0;
}
&#10;#ccvkgamihp .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 16px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}
&#10;#ccvkgamihp .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}
&#10;#ccvkgamihp .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}
&#10;#ccvkgamihp .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}
&#10;#ccvkgamihp .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#ccvkgamihp .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ccvkgamihp .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}
&#10;#ccvkgamihp .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}
&#10;#ccvkgamihp .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}
&#10;#ccvkgamihp .gt_column_spanner_outer:first-child {
  padding-left: 0;
}
&#10;#ccvkgamihp .gt_column_spanner_outer:last-child {
  padding-right: 0;
}
&#10;#ccvkgamihp .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}
&#10;#ccvkgamihp .gt_spanner_row {
  border-bottom-style: hidden;
}
&#10;#ccvkgamihp .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}
&#10;#ccvkgamihp .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}
&#10;#ccvkgamihp .gt_from_md > :first-child {
  margin-top: 0;
}
&#10;#ccvkgamihp .gt_from_md > :last-child {
  margin-bottom: 0;
}
&#10;#ccvkgamihp .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}
&#10;#ccvkgamihp .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ccvkgamihp .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}
&#10;#ccvkgamihp .gt_row_group_first td {
  border-top-width: 2px;
}
&#10;#ccvkgamihp .gt_row_group_first th {
  border-top-width: 2px;
}
&#10;#ccvkgamihp .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ccvkgamihp .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}
&#10;#ccvkgamihp .gt_first_summary_row.thick {
  border-top-width: 2px;
}
&#10;#ccvkgamihp .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ccvkgamihp .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ccvkgamihp .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}
&#10;#ccvkgamihp .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}
&#10;#ccvkgamihp .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}
&#10;#ccvkgamihp .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}
&#10;#ccvkgamihp .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#ccvkgamihp .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ccvkgamihp .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}
&#10;#ccvkgamihp .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}
&#10;#ccvkgamihp .gt_left {
  text-align: left;
}
&#10;#ccvkgamihp .gt_center {
  text-align: center;
}
&#10;#ccvkgamihp .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}
&#10;#ccvkgamihp .gt_font_normal {
  font-weight: normal;
}
&#10;#ccvkgamihp .gt_font_bold {
  font-weight: bold;
}
&#10;#ccvkgamihp .gt_font_italic {
  font-style: italic;
}
&#10;#ccvkgamihp .gt_super {
  font-size: 65%;
}
&#10;#ccvkgamihp .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}
&#10;#ccvkgamihp .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}
&#10;#ccvkgamihp .gt_indent_1 {
  text-indent: 5px;
}
&#10;#ccvkgamihp .gt_indent_2 {
  text-indent: 10px;
}
&#10;#ccvkgamihp .gt_indent_3 {
  text-indent: 15px;
}
&#10;#ccvkgamihp .gt_indent_4 {
  text-indent: 20px;
}
&#10;#ccvkgamihp .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="3" class="gt_heading gt_title gt_font_normal" style><strong>Demand for faecal sludge emptying services</strong></td>
    </tr>
    <tr class="gt_heading">
      <td colspan="3" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>summarised for 175 countries</td>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id=""></th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="population">population</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="percent">percent</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><th id="stub_1_1" scope="row" class="gt_row gt_left gt_stub">mechanized</th>
<td headers="stub_1_1 sum_population_emptying_method" class="gt_row gt_right">1,030,317,694</td>
<td headers="stub_1_1 percent" class="gt_row gt_right">25%</td></tr>
    <tr><th id="stub_1_2" scope="row" class="gt_row gt_left gt_stub">no facility</th>
<td headers="stub_1_2 sum_population_emptying_method" class="gt_row gt_right">661,998,822</td>
<td headers="stub_1_2 percent" class="gt_row gt_right">16%</td></tr>
    <tr><th id="stub_1_3" scope="row" class="gt_row gt_left gt_stub">non-mechanized</th>
<td headers="stub_1_3 sum_population_emptying_method" class="gt_row gt_right">1,784,240,549</td>
<td headers="stub_1_3 percent" class="gt_row gt_right">43%</td></tr>
    <tr><th id="stub_1_4" scope="row" class="gt_row gt_left gt_stub">unemptiable</th>
<td headers="stub_1_4 sum_population_emptying_method" class="gt_row gt_right">681,220,088</td>
<td headers="stub_1_4 percent" class="gt_row gt_right">16%</td></tr>
    <tr><th id="stub_1_5" scope="row" class="gt_row gt_left gt_stub">Total</th>
<td headers="stub_1_5 sum_population_emptying_method" class="gt_row gt_right">4,157,777,154</td>
<td headers="stub_1_5 percent" class="gt_row gt_right">100%</td></tr>
  </tbody>
  &#10;  
</table>
</div>

## License

Data are available as
[CC-BY](https://github.com/openwashdata/fsmglobal/blob/main/LICENSE.md).

## Citation

Please cite using:

``` r
citation("fsmglobal")
#> To cite package 'fsmglobal' in publications use:
#> 
#>   Greene N, Hennessy S, Rogers T, Tsai J, III F, Schöbitz L (2023).
#>   "fsmglobal. Global Faecal Sludge Emptying Services Demand."
#>   doi:10.5281/zenodo.8208293 <https://doi.org/10.5281/zenodo.8208293>,
#>   <https://openwashdata.github.io/fsmglobal/>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Misc{greenehennessy:2023,
#>     title = {fsmglobal. Global Faecal Sludge Emptying Services Demand},
#>     author = {Nicola Greene and Sarah Hennessy and Tate W. Rogers and Jocelyn Tsai and Francis L. de los Reyes III and Lars Schöbitz},
#>     year = {2023},
#>     url = {https://openwashdata.github.io/fsmglobal/},
#>     doi = {10.5281/zenodo.8208293},
#>     abstract = {Global faecal sludge emptying demand data for 175 countries. Demand is quantified by population size receiving one of four emptying methods (mechanized, non-mechanized, unemptiable, no facility). The demand is disaggregated by rural and urban percentages of population.},
#>     version = {0.0.1},
#>   }
```

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
