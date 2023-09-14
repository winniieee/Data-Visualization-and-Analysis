# Following  Prabhakaran's tutorial
#install the package
install.packages("tidyverse")
#set up the ggplot2 library
library(ggplot2)

options(scipen=999)  # turn off scientific notation like 1e+06

data("midwest", package = "ggplot2")  # load the data
midwest <- read.csv("http://goo.gl/G1K41K") # alt source 


plot(midwest$poptotal) #test a basic plot in R
hist(midwest$poptotal) #test a basic histogram in R

# initialize ggplot and make a simple scatterplot of area by population

g <-ggplot(midwest, aes(x=area, y=poptotal))+
  geom_point()+ #add points
  geom_smooth(method = "lm", se = FALSE) #plot a simple linear regression
  #theme_classic() #add a classic theme
g

g <-ggplot(midwest, aes(x=area, y=poptotal, color=state))+
  geom_point()+ #add points
  geom_smooth(method = "lm", se = FALSE) #plot a simple linear regression
#theme_classic() #add a classic theme

g
ggsave(g, file = "plot.pdf", width=4, height=3)
