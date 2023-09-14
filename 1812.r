#load ggplot2 package
library(ggplot2)

troops <- read.table("____", header=T)
cities <- read.table("____", header=T)

#check out a histogram of the number of survivors
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


#save final plot
ggsave(plot_troops, file = "minard-troops.pdf", width=12, height=3)
