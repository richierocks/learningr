Solutions to Exercises
======================


sd(0:100)


demo(plotmath)


atan(1 / 1:1000)


x <- 1:1000
y <- atan(1 / x)
z <- 1 / tan(y)


x == z
identical(x, z)
all.equal(x, z)
all.equal(x, z, tolerance = 0)


true_and_missing <- c(NA, TRUE, NA)
false_and_missing <- c(FALSE, FALSE, NA)
mixed <- c(TRUE, FALSE, NA)

any(true_and_missing)
any(false_and_missing)
any(mixed)
all(true_and_missing)
all(false_and_missing)
all(mixed)


class(Inf)
class(NA)
class(NaN) 
class("")


pets <- factor(sample(
  c("dog", "cat", "hamster", "goldfish"),
  1000,
  replace = TRUE
))
head(pets)
summary(pets)     


carrot <- 1
potato <- 2
swede  <- 3
ls(pattern = "a")


n <- seq_len(20)
triangular <- n * (n + 1) / 2
names(triangular) <- letters[seq_along(n)]
triangular[c("a", "e", "i", "o")]


diag(abs(seq.int(-11, 11)))


identity_20_by_21 <- diag(rep.int(1, 20), 20, 21)    
below_the_diagonal <- rbind(0, identity_20_by_21) 
identity_21_by_20 <- diag(rep.int(1, 20), 21, 20)    
above_the_diagonal <- cbind(0, identity_21_by_20)
on_the_diagonal <- diag(abs(seq.int(-10, 10)))
wilkinson_21 <- below_the_diagonal + above_the_diagonal + on_the_diagonal
eigen(wilkinson_21)$values 


list(
  "0 to 9"   = c(0, 1, 4, 9),
  "10 to 19" = 16,
  "20 to 29" = 25,
  "30 to 39" = 36,
  "40 to 49" = 49,
  "50 to 59" = NULL,
  "60 to 69" = 64,
  "70 to 79" = NULL,
  "80 to 89" = 81,
  "90 to 99" = NULL
)  


x <- 0:99
sqrt_x <- sqrt(x)
is_square_number <- sqrt_x == floor(sqrt_x)
square_numbers <- x[is_square_number]
groups <- cut(
  square_numbers, 
  seq.int(min(x), max(x), 10),
  include.lowest = TRUE,
  right = FALSE
)
split(square_numbers, groups)


iris_numeric <- iris[, 1:4]
colMeans(iris_numeric)


beaver1$id <- 1
beaver2$id <- 2
both_beavers <- rbind(beaver1, beaver2)
subset(both_beavers, as.logical(activ))


multiples_of_pi <- new.env()
multiples_of_pi[["two_pi"]] <- 2 * pi   
multiples_of_pi$three_pi <- 3 * pi
assign("four_pi", 4 * pi, multiples_of_pi)
ls(multiples_of_pi)


is_even <- function(x) (x %% 2) == 0
is_even(c(-5:5, Inf, -Inf, NA, NaN))


args_and_body <- function(fn)
{
  list(arguments = formals(fn), body = body(fn))
}
args_and_body(var)
args_and_body(alarm)


formatC(pi, digits = 16)


#"split on an optional comma, a compulsory space, an optional
#hyphen and an optional space"
strsplit(x, ",? -? ?")
#or, grouping the final hyphen and space
strsplit(x, ",? (- )?")


scores <- three_d6(1000)
bonuses <- cut(
  scores, 
  c(2, 3, 5, 8, 12, 15, 17, 18),
  labels = -3:3
)
table(bonuses)


score <- two_d6(1)
if(score %in% c(2, 3, 12))
{
   game_status <- FALSE
   point <- NA
} else if(score %in% c(7, 11))
{
   game_status <- TRUE
   point <- NA
} else 
{
   game_status <- NA
   point <- score
}


if(is.na(game_status))
{
  repeat({
    score <- two_d6(1)
    if(score == 7)
    {
      game_status <- FALSE
      break
    } else 
    if(score == point)
    {
      game_status <- TRUE
      break
    }
  })
}


nchar_sea_shells <- nchar(sea_shells)

for(i in min(nchar_sea_shells):max(nchar_sea_shells))
{
  message("These words have ", i, " letters:")
  print(toString(unique(sea_shells[nchar_sea_shells == i])))
}


vapply(wayans, length, integer(1))


with(commute_data, tapply(time, mode, quantile, prob = 0.75))
ddply(commute_data, .(mode), summarise, time_p75 = quantile(time, 0.75))


install.packages("lubridate")


pkgs <- installed.packages()
table(pkgs[, "LibPath"])


in_string <- c("1940-07-07", "1940-10-09", "1942-06-18", "1943-02-25")
(parsed <- strptime(in_string, "%Y-%m-%d"))
(out_string <- strftime(parsed, "%a %d %b %y"))


tzfile <- file.path(R.home("share"), "zoneinfo", "zone.tab")
tzones <- read.delim(
  tzfile, 
  row.names = NULL, 
  header = FALSE,
  col.names = c("country", "coords", "name", "comments"),
  as.is = TRUE, 
  fill = TRUE, 
  comment.char = "#"
)


zodiac_sign <- function(x)
{
  month_x <- month(x, label = TRUE)
  day_x <- day(x)
  switch(
    month_x,
    Jan = if(day_x < 20) "Capricorn" else "Aquarius",
    Feb = if(day_x < 19) "Aquarius" else "Pisces",
    Mar = if(day_x < 21) "Pisces" else "Aries",
    Apr = if(day_x < 20) "Aries" else "Taurus",
    May = if(day_x < 21) "Taurus" else "Gemini",
    Jun = if(day_x < 21) "Gemini" else "Cancer",
    Jul = if(day_x < 23) "Cancer" else "Leo",
    Aug = if(day_x < 23) "Leo" else "Virgo",
    Sep = if(day_x < 23) "Virgo" else "Libra",
    Oct = if(day_x < 23) "Libra" else "Scorpio",
    Nov = if(day_x < 22) "Scorpio" else "Sagittarius",
    Dec = if(day_x < 22) "Sagittarius" else "Capricorn"
  )
}
#Usage is, for example,
nicolaus_copernicus_birth_date <- as.Date("1473-02-19")
zodiac_sign(nicolaus_copernicus_birth_date)


hafu_file <- system.file("extdata", "hafu.csv", package = "learningr")
hafu_data <- read.csv(hafu_file)


library(xlsx)
gonorrhoea_file <- system.file(
  "extdata", 
  "multi-drug-resistant gonorrhoea infection.xls", 
  package = "learningr"
)
gonorrhoea_data <- read.xlsx2(
  gonorrhoea_file,
  sheetIndex = 1,
  colClasses = c("integer", "character", "character", "numeric")
)


library(RSQLite)
driver <- dbDriver("SQLite")
db_file <- system.file("extdata", "crabtag.sqlite", package = "learningr")
conn <- dbConnect(driver, db_file)

query <- "SELECT * FROM Daylog"
head(daylog <- dbGetQuery(conn, query))

dbDisconnect(conn)
dbUnloadDriver(driver) 


head(daylog <- query_crab_tag_db("SELECT * FROM Daylog"))


get_table_from_crab_tag_db <- function(tbl)
{
  driver <- dbDriver("SQLite")
  db_file <- system.file("extdata", "crabtag.sqlite", package = "learningr")
  conn <- dbConnect(driver, db_file)
  on.exit(
    {
      dbDisconnect(conn)
      dbUnloadDriver(driver)
    }
  )
  dbReadTable(conn, tbl)
}
head(daylog <- get_table_from_crab_tag_db("Daylog"))


library(stringr)
data(hafu, package = "learningr")
hafu$FathersNationalityIsUncertain <- str_detect(hafu$Father, fixed("?"))
hafu$MothersNationalityIsUncertain <- str_detect(hafu$Mother, fixed("?"))


hafu$Father <- str_replace(hafu$Father, fixed("?"), "")
hafu$Mother <- str_replace(hafu$Mother, fixed("?"), "")


hafu_long <- melt(hafu, measure.vars = c("Father", "Mother"))


top10 <- function(x)
{
  counts <- table(x, useNA = "always")
  head(sort(counts, decreasing = TRUE), 10)
}
top10(hafu$Mother)


top10_v2 <- function(x)
{
  counts <- count(x)
  head(arrange(counts, desc(freq)), 10)
}
top10_v2(hafu$Mother)


with(obama_vs_mccain, cor(Unemployment, Obama))


with(obama_vs_mccain, plot(Unemployment, Obama))
xyplot(Obama ~ Unemployment, obama_vs_mccain)
ggplot(obama_vs_mccain, aes(Unemployment, Obama)) +
  geom_point()


plot_numbers <- 1:2
layout(matrix(plot_numbers, ncol = 2, byrow = TRUE))
for(drug_use in c(FALSE, TRUE))
{
  group_data <- subset(alpe_d_huez2, DrugUse == drug_use)
  with(group_data, hist(NumericTime))
}

histogram(~ NumericTime | DrugUse, alpe_d_huez2) 

ggplot(alpe_d_huez2, aes(NumericTime)) +
  geom_histogram(binwidth = 2) + 
  facet_wrap(~ DrugUse)


boxplot(NumericTime ~ DrugUse, alpe_d_huez2)
bwplot(DrugUse ~ NumericTime, alpe_d_huez2)

ggplot(alpe_d_huez2, aes(DrugUse, NumericTime, group = DrugUse)) +
  geom_boxplot()


ggplot(gonorrhoea, aes(Age.Group, Rate)) +
  geom_bar(stat = "identity") +
  facet_wrap(~ Year + Ethnicity + Gender)


ggplot(gonorrhoea, aes(Age.Group, Rate, group = Year, fill = Year)) +
  geom_bar(stat = "identity", position = "dodge") +
  facet_wrap(~ Ethnicity + Gender)


ggplot(gonorrhoea, aes(Age.Group, Rate, group = Year, colour = Year)) +
  geom_line() +
  facet_wrap(~ Ethnicity + Gender)


ggplot(gonorrhoea, aes(Age.Group, Rate, group = Year, colour = Year)) +
  geom_line() +
  facet_grid(Ethnicity ~ Gender)


ggplot(gonorrhoea, aes(Age.Group, Rate, group = Year, colour = Year)) +
  geom_line() +
  facet_grid(Ethnicity ~ Gender, scales = "free_y")


dpois(3, 3)


pnbinom(12, 1, 0.25)


qbirthday(0.9)


model1 <- lm(
  Rate ~ Year + Age.Group + Ethnicity + Gender, 
  gonorrhoea, 
  subset = Age.Group %in% c("15 to 19" ,"20 to 24" ,"25 to 29" ,"30 to 34")
)
summary(model1)


model2 <- update(model1, ~ . - Year)
summary(model2)


install.packages("betareg")


ovm <- within(obama_vs_mccain, Obama <- Obama / 100)


library(betareg)
beta_model1 <- betareg(
 Obama ~ Turnout + Population + Unemployment + Urbanisation + Black + Protestant,
 ovm,
 subset = State != "District of Columbia"
)
summary(beta_model1)


beta_model2 <- update(beta_model1, ~ . - Urbanisation)
summary(beta_model2)


beta_model3 <- update(beta_model2, ~ . - Population)
summary(beta_model3)


plot_numbers <- 1:6
layout(matrix(plot_numbers, ncol = 2, byrow = TRUE))
plot(beta_model3, plot_numbers)


harmonic_mean <- function(x, na.rm = FALSE)
{
  if(!is.numeric(x))
  {
    warning("Coercing 'x' to be numeric.")
    x <- as.numeric(x)
  }
  if(any(!is.na(x) & x <= 0))
  {
    stop("'x' contains non-positive values")
  }
  1 / mean(1 / x, na.rm = na.rm)
}


test.harmonic_mean.1_2_4.returns_12_over_7 <- function()
{
  expected <- 12 / 7
  actual <- harmonic_mean(c(1, 2, 4))
  checkEqualsNumeric(expected, actual)
}
test.harmonic_mean.no_inputs.throws_error <- function()
{
  checkException(harmonic_mean())
}
test.harmonic_mean.some_missing.returns_na <- function()
{
  expected <- NA_real_
  actual <- harmonic_mean(c(1, 2, 4, NA))
  checkEqualsNumeric(expected, actual)
}
test.harmonic_mean.some_missing_with_nas_removed.returns_12_over_7 <- function()
{
  expected <- 12 / 7
  actual <- harmonic_mean(c(1, 2, 4, NA), na.rm = TRUE)
  checkEqualsNumeric(expected, actual)
}
test.harmonic_mean.non_numeric_input.throws_warning <- function()
{
  old_ops <- options(warn = 2)
  on.exit(options(old_ops))
  checkException(harmonic_mean("1"))
}
test.harmonic_mean.zero_inputs.throws_error <- function()
{
  checkException(harmonic_mean(0))
}


expect_equal(12 /7, harmonic_mean(c(1, 2, 4)))
expect_error(harmonic_mean())
expect_equal(NA_real_, harmonic_mean(c(1, 2, 4, NA)))
expect_equal(12 /7, harmonic_mean(c(1, 2, 4, NA), na.rm = TRUE))
expect_warning(harmonic_mean("1"))
expect_error(harmonic_mean(0))


harmonic_mean <- function(x, na.rm = FALSE)
{
  if(!is.numeric(x))
  {
    warning("Coercing 'x' to be numeric.")
    x <- as.numeric(x)
  }
  if(any(!is.na(x) & x <= 0))
  {
    stop("'x' contains non-positive values")
  }
  result <- 1 / mean(1 / x, na.rm = na.rm)
  class(result) <- "harmonic"
  result
}


print.harmonic <- function(x, ...)
{
  cat("The harmonic mean is", x, "\n", ...)
}


sum_of_squares <- function(n)
{
  n * (n + 1) * (2 * n + 1) / 6
}
x <- 1:10
squares_data <- data.frame(x = x, y = sum_of_squares(x))


package.skeleton("squares", c("sum_of_squares", "squares_data"))


#' Sum of Squares
#' 
#' Calculates the sum of squares of the first \code{n} natural numbers.
#'
#' @param n A positive integer.
#' @return A integer equal to the sum of the squars of the first \code{n}
#' natural numbers.
#' @author Richie Cotton.
#' @seealso \code{\link[base]{sum}}
#' @examples
#' sum_of_squares(1:20)
#' @keywords misc
#' @export


#' squares: Sums of squares.
#' 
#' A test package that contains data of the sum of squares of natural 
#' numbers, and a function to calculate more values.
#' 
#' @author Richie Cotton
#' @docType package
#' @name squares
#' @aliases squares squares-package
#' @keywords package
NULL


#' Sum of squares dataset
#' 
#' The sum of squares of natural numbers.
#' \itemize{
#'   \item{x}{Natural numbers.}
#'   \item{y}{The sum of squares from 1 to \code{x}.}
#' }
#' 
#' @docType data
#' @keywords datasets
#' @name squares_data
#' @usage data(squares_data)
#' @format A data frame with 10 rows and 2 variables.
NULL


check("squares")
build("squares")


