Distributions And Modelling
---------------------------  


Chapter Goals
~~~~~~~~~~~~~


Random Numbers
~~~~~~~~~~~~~~


The sample Function
^^^^^^^^^^^^^^^^^^^


sample(7)


sample(7, 5)


sample(7, 10, replace = TRUE)


sample(colors(), 5) #a great way to pick the colour scheme for your house


sample(.leap.seconds, 4)


weights <- c(1, 1, 2, 3, 5, 8, 13, 21, 8, 3, 1, 1)
sample(month.abb, 1, prob = weights)


Sampling From Distributions
^^^^^^^^^^^^^^^^^^^^^^^^^^^


runif(5)         #5 uniform random numbers between 0 and 1
runif(5, 1,10)   #5 uniform random numbers between 1 and 10
rnorm(5)         #5 normal random numbers with mean 0 and std dev 1
rnorm(5, 3, 7)   #5 normal random numbers with mean 3 and std dev 7


RNGkind()


set.seed(1)
runif(5)
set.seed(1)
runif(5)
set.seed(1)
runif(5)


Distributions
~~~~~~~~~~~~~


Formulae
~~~~~~~~


Rate ~ Year + Age.Group + Ethnicity + Gender


Rate ~ 0 + Year + Age.Group + Ethnicity + Gender


Rate ~ Year * Age.Group * Ethnicity * Gender


Rate ~ Year + Ethnicity + Gender + Year:Ethnicity + Year:Ethnicity:Gender


Rate ~ (Year + Ethnicity + Gender) ^ 2


Rate ~ I(Year ^ 2)  #year squared, not an interaction


A First Model: Linear Regressions
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


model1 <- lm(Rate ~ Year + Age.Group + Ethnicity + Gender, gonorrhoea)


model1


lapply(Filter(is.factor, gonorrhoea), levels)


summary(model1)


Comparing and Updating Models
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


model2 <- update(model1, ~ . - Year)
summary(model2)


anova(model1, model2)


AIC(model1, model2)
BIC(model1, model2)


silly_model <- update(model1, ~ . - Age.Group)
anova(model1, silly_model)
AIC(model1, silly_model)
BIC(model1, silly_model)


model3 <- update(model2, ~ . - Gender)
summary(model3)


g2 <- within(
  gonorrhoea,
  {
    Age.Group <- relevel(Age.Group, "30 to 34")
    Ethnicity <- relevel(Ethnicity, "Non-Hispanic Whites")
  }
)
model4 <- update(model3, data = g2)
summary(model4)


Plotting and Inspecting Models
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


plot_numbers <- 1:6
layout(matrix(plot_numbers, ncol = 2, byrow = TRUE))
plot(model4, plot_numbers)


gonorrhoea[c(40, 41, 160), ]


str(model4)
unclass(model4)


formula(model4)
nobs(model4)
head(residuals(model4))
head(fitted(model4))
head(coefficients(model4))


head(cooks.distance(model4))
summary(model4)$r.squared


diagnostics <- data.frame(
  residuals = residuals(model4),  
  fitted    = fitted(model4)  
)
ggplot(diagnostics, aes(fitted, residuals)) +
  geom_point() +
  geom_smooth(method = "loess")


new_data <- data.frame(
  Age.Group = "30 to 34", 
  Ethnicity = "Non-Hispanic Whites"
)
predict(model4, new_data)


subset(
  gonorrhoea, 
  Age.Group == "30 to 34" & Ethnicity == "Non-Hispanic Whites"
)


Other Model Types
~~~~~~~~~~~~~~~~~


glm(true_or_false ~ some + predictor + variables, data, family = binomial())


lme(y ~ some + fixed + effects, data, random = ~ 1 | random / effects)


Summary
~~~~~~~


Test Your Knowledge: Quiz
~~~~~~~~~~~~~~~~~~~~~~~~~


Test Your Knowledge: Exercises
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


