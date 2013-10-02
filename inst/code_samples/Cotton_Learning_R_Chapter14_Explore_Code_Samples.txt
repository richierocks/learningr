Exploring And Visualising
-------------------------  


Chapter Goals
~~~~~~~~~~~~~


Summary Statistics
~~~~~~~~~~~~~~~~~~


data(obama_vs_mccain, package = "learningr")
obama <- obama_vs_mccain$Obama
mean(obama)
median(obama)


table(cut(obama, seq.int(0, 100, 10)))


var(obama)
sd(obama)
mad(obama)


min(obama)
with(obama_vs_mccain, pmin(Obama, McCain))
range(obama)


cummin(obama)
cumsum(obama)
cumprod(obama)


quantile(obama)
quantile(obama, type = 5)    #to reproduce SAS results
quantile(obama, c(0.9, 0.95, 0.99)) 


IQR(obama)


fivenum(obama)


summary(obama_vs_mccain)


with(obama_vs_mccain, cor(Obama, McCain))
with(obama_vs_mccain, cancor(Obama, McCain))
with(obama_vs_mccain, cov(Obama, McCain))


The Three Plotting Systems
~~~~~~~~~~~~~~~~~~~~~~~~~~


Scatterplots
~~~~~~~~~~~~~~


Take 1: base Graphics
^^^^^^^^^^^^^^^^^^^^^


obama_vs_mccain <- obama_vs_mccain[!is.na(obama_vs_mccain$Turnout), ]


with(obama_vs_mccain, plot(Income, Turnout))


with(obama_vs_mccain, plot(Income, Turnout, col = "violet", pch = 20))


with(obama_vs_mccain, plot(Income, Turnout, log = "y"))


with(obama_vs_mccain, plot(Income, Turnout, log = "xy"))


par(mar = c(3, 3, 0.5, 0.5), oma = rep.int(0, 4), mgp = c(2, 1, 0))
regions <- levels(obama_vs_mccain$Region)
plot_numbers <- seq_along(regions)
layout(matrix(plot_numbers, ncol = 5, byrow = TRUE))
for(region in regions)
{
  regional_data <- subset(obama_vs_mccain, Region == region)
  with(regional_data,  plot(Income, Turnout))
}


Take 2: lattice Graphics
^^^^^^^^^^^^^^^^^^^^^^^^


library(lattice)
xyplot(Turnout ~ Income, obama_vs_mccain)


xyplot(Turnout ~ Income, obama_vs_mccain, col = "violet", pch = 20)


xyplot(
  Turnout ~ Income, 
  obama_vs_mccain,
  scales = list(log = TRUE)            #both axes log-scaled
)


xyplot(
  Turnout ~ Income, 
  obama_vs_mccain,
  scales = list(y = list(log = TRUE))  #y axis log-scaled
)


xyplot(
  Turnout ~ Income | Region,
  obama_vs_mccain,
  scales = list(
    log         = TRUE,
    relation    = "same",
    alternating = FALSE
  ),
  layout = c(5, 2)
)


(lat1 <- xyplot(
  Turnout ~ Income | Region,
  obama_vs_mccain
))


(lat2 <- update(lat1, col = "violet", pch = 20))


Take 3: ggplot2 Graphics
^^^^^^^^^^^^^^^^^^^^^^^^


library(ggplot2)
ggplot(obama_vs_mccain, aes(Income, Turnout)) +
  geom_point() 


ggplot(obama_vs_mccain, aes(Income, Turnout)) +
  geom_point(color = "violet", shape = 20) 


ggplot(obama_vs_mccain, aes(Income, Turnout)) +
  geom_point() +
  scale_x_log10(breaks = seq(2e4, 4e4, 1e4)) +
  scale_y_log10(breaks = seq(50, 75, 5))


ggplot(obama_vs_mccain, aes(Income, Turnout)) +
  geom_point() +
  scale_x_log10(breaks = seq(2e4, 4e4, 1e4)) +
  scale_y_log10(breaks = seq(50, 75, 5)) +
  facet_wrap(~ Region, ncol = 5) +
  theme(axis.text.x = element_text(angle = 30, hjust = 1))


(gg1 <- ggplot(obama_vs_mccain, aes(Income, Turnout)) + 
  geom_point()
)


(gg2 <- gg1 +
  facet_wrap(~ Region, ncol = 5)
)


Line Plots
~~~~~~~~~~


with(
  crab_tag$daylog,
  plot(Date, -Max.Depth, type = "l", ylim = c(-max(Max.Depth), 0))
)


with(
  crab_tag$daylog,
  lines(Date, -Min.Depth, col = "blue")
)


xyplot(-Min.Depth + -Max.Depth ~ Date, crab_tag$daylog, type = "l")


ggplot(crab_tag$daylog, aes(Date, -Min.Depth)) +
  geom_line() 


ggplot(crab_tag$daylog, aes(Date)) +
  geom_line(aes(y = -Max.Depth)) +
  geom_line(aes(y = -Min.Depth))


library(reshape2)
crab_long <- melt(
  crab_tag$daylog, 
  id.vars      = "Date", 
  measure.vars = c("Min.Depth", "Max.Depth")
)
ggplot(crab_long, aes(Date, -value, group = variable)) +
  geom_line()


ggplot(crab_tag$daylog, aes(Date, ymin = -Min.Depth, ymax = -Max.Depth)) +
  geom_ribbon(color = "black", fill = "white") 


Histograms
~~~~~~~~~~


with(obama_vs_mccain, hist(Obama))


with(obama_vs_mccain, 
  hist(Obama, 4, main = "An exact number of bins")
)


with(obama_vs_mccain, 
  hist(Obama, seq.int(0, 100, 5), main = "A vector of bin edges")
)


with(obama_vs_mccain, 
  hist(Obama, "FD", main = "The name of a method")
)


with(obama_vs_mccain, 
  hist(Obama, nclass.scott, main = "A function for the number of bins")
)


binner <- function(x) 
{
  seq(min(x, na.rm = TRUE), max(x, na.rm = TRUE), length.out = 50)
}
with(obama_vs_mccain, 
  hist(Obama, binner, main = "A function for the bin edges")
)


with(obama_vs_mccain, hist(Obama, freq = FALSE))


histogram(~ Obama, obama_vs_mccain)


histogram(~ Obama, obama_vs_mccain, breaks = 10)


histogram(~ Obama, obama_vs_mccain, type = "percent")


ggplot(obama_vs_mccain, aes(Obama)) +
  geom_histogram(binwidth = 5)


ggplot(obama_vs_mccain, aes(Obama, ..density..)) +
  geom_histogram(binwidth = 5)


Boxplots
~~~~~~~~


boxplot(Obama ~ Region, data = obama_vs_mccain)


ovm <- within(
  obama_vs_mccain, 
  Region <- reorder(Region, Obama, median)
)
boxplot(Obama ~ Region, data = ovm)


bwplot(Obama ~ Region, data = ovm)


ggplot(ovm, aes(Region, Obama)) +
  geom_boxplot()


Barcharts
~~~~~~~~~


ovm <- ovm[!(ovm$State %in% c("Alaska", "Hawaii")), ]


par(las = 1, mar = c(3, 9, 1, 1))
with(ovm, barplot(Catholic, names.arg = State, horiz = TRUE))


religions <- with(ovm, rbind(Catholic, Protestant, Non.religious, Other))
colnames(religions) <- ovm$State
par(las = 1, mar = c(3, 9, 1, 1))
barplot(religions, horiz = TRUE, beside = FALSE)


barchart(State ~ Catholic, ovm)


barchart(
  State ~ Catholic + Protestant + Non.religious + Other, 
  ovm, 
  stack = TRUE
)


religions_long <- melt(
  ovm, 
  id.vars = "State",
  measure.vars = c("Catholic", "Protestant", "Non.religious", "Other")
)


ggplot(religions_long, aes(State, value, fill = variable)) +
  geom_bar(stat = "identity") +
  coord_flip()


ggplot(religions_long, aes(State, value, fill = variable)) +
  geom_bar(stat = "identity", position = "dodge") +
  coord_flip()


Other Plotting Packages and Systems
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


library(devtools)
install_github("rCharts", "ramnathv")


Summary
~~~~~~~


Test Your Knowledge: Quiz
~~~~~~~~~~~~~~~~~~~~~~~~~


Test Your Knowledge: Exercises
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


