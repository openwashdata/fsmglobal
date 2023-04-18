#' fsmglobal
#'
#' Populations requiring faecal sludge emptying services.
#'
#' @format A tibble with 700 rows and 9 variables:
#' \describe{
#'   \item{iso3c}{International Standards Organization (ISO) 3-digit alphabetic codes.}
#'   \item{country}{Name of the country.}
#'   \item{emptying_method}{Type of faecal sludge emptying method for corresponding population in `population_emptying_method`.}
#'   \item{population_2017}{Total country population in 2017.}
#'   \item{population_emptying_method}{ Total population requiring faecal sludge emptying services for type of method identified in `emptying_method`.}
#'   \item{count_pits_septics}{ Total number of pit latrines and septic tanks in country.}
#'   \item{emptying_demand}{ Emptying demand as the proportion of `population_emptying_method` / `population_2017`.}
#'   \item{urban_demand}{ Proportion of urban population.}
#'   \item{rural_demand}{ Proportion of rural population.}
#' }
#' @source {Originally published in: Greene, N., Hennessy, S., Rogers, T. W., Tsai, J., & de los Reyes III, F. L. (2021). The role of emptying services in provision of safely managed sanitation: A classification and quantification of the needs of LMICs. Journal of Environmental Management, 290, 112612. https://doi.org/10.1016/j.jenvman.2021.112612}
#'
#'
"fsmglobal"
