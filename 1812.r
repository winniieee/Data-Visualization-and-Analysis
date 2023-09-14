#This script will help you get started with plotting the 1812 data
#load ggplot2 package
library(ggplot2)

#replace file locations with your own paths
#by default, read.table assumes there is no header in the data, but we do have a
#header of column names, so we want to set that to true with header=T
troops <- read.table("____", header=T)
cities <- read.table("____", header=T)

#check out a histogram of the number of survivors
#(I am not sure why the number increases at the end)
hist(troops$survivors)

#this code sets the commands for plotting the troops along the longitude 
#(x-axis) and latitude (y-axis)
plot_troops <- ggplot(troops, aes(long, lat)) +
  #make the line thickness reflect the number of survivors
  geom_path(aes(size = survivors, colour = direction, group = group))+
  #label the cities
  geom_text(aes(label = city), size = 4, data = cities)+
  scale_colour_manual(values = c("grey50","red")) +
  xlab(NULL) + 
  ylab(NULL)
plot_polished

#run the actual plot
plot_troops

#now go back to the above code
#refine your plot by manipulating the different aesthetics and layers

#save your final plot
ggsave(plot_troops, file = "minard-troops.pdf", width=12, height=3)