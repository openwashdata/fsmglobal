# examples

``` r

library(fsmglobal)
library(gt)
library(dplyr)
library(ggplot2)
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

| **Demand for faecal sludge emptying services** |               |         |
|------------------------------------------------|---------------|---------|
| summarised for 175 countries                   |               |         |
|                                                | population    | percent |
| mechanized                                     | 1,030,317,694 | 25%     |
| no facility                                    | 661,998,822   | 16%     |
| non-mechanized                                 | 1,784,240,549 | 43%     |
| unemptiable                                    | 681,220,088   | 16%     |
| Total                                          | 4,157,777,154 | 100%    |
