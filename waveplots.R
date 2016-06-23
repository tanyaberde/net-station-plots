# Plot waves separated by condition for each montage you computed in averages.R

## Set your format preferences. Might need to see see plot.raw first to eyeball
lower.volt=-2.5 ### 
upper.volt=1.5 ###
volt.by=0.5 ### How much should voltage limits skip?
wavethick=1 ### How thick should the waves be?
time1=250### ! Lower bound of time window
time2=350 ### ! Upper bound of time window
electrode = "Expectation x Valence" ### Can also replace with factor names
nbSubs = "36" ###
groupSubs = "All Participants" ###

title=paste(electrode,"\n", groupSubs, "\n", "N = ", nbSubs, sep=" ") # Automatic title to be pasted on graph

# Factorize the conditions in the original montage table
require(reshape)
d2 <- melt(mont1.table, id="ms")

View(d2) # Notice one factor alternates as
        # Congruent(*250)-Incongruent(*250)-Congruent(*250)-Incongruent(*250) 
        # to vary according to colour below, blue-red-blue-red
        # and the other factor alternates as
        # Reward-(*500)-Punish(*500) 
        # to vary according to linetype below, solid-dashed.

require(ggplot2)

# Skeleton graph
plot.raw <- ggplot(d2, aes(x=ms, 
                           y=value, 
                           colour=variable, # Make variable in d2 dataframe vary by colour according to scale_colour_manual below
                           linetype=variable) # Make variable in d2 dataframe vary by linetype according to scale_linetype_manual below
                   ) + 
  geom_hline(yintercept=0) + geom_vline(xintercept=0) + ##! Moved from plot.clean
  geom_line(size=wavethick) +
  scale_linetype_manual(values = c(rep("solid", 2), rep("31", 2))) +
  scale_colour_manual(values=c("turquoise3", "tomato", "turquoise3", "tomato"))

# Standard themes and formatting added onto basic skeleton graph
theme_set(theme_grey(base_size = 16))  # Set default font size for the session; only need to run this once

plot.clean <- plot.raw +
  ylab("μV") + 
  scale_x_continuous(breaks=seq(prestim,poststim,100), limits=c(prestim-50,poststim+50)) + ##! Extended prestim-poststim limits
  scale_y_continuous(breaks=seq(lower.volt,upper.volt,volt.by), limits=c(lower.volt, upper.volt)) +
  theme(aspect.ratio=.5) + # Makes y-axis half as long as x-axis
  theme(legend.title=element_blank()) + # Remove title for all legends
#   scale_colour_brewer(type="div", palette=1) + # Neat auto colors; comment back in if you did not use *_manual arguments upstairs on lines 27-28
  ggtitle(title)

# Add a pair of red dotted lines to indicate time window
plot.window <-
  plot.clean +
  geom_vline(aes(xintercept=time1), colour="red", linetype="dashed") +
  geom_vline(aes(xintercept=time2), colour="red", linetype="dashed")

# View the plots at each step
print(plot.raw)
print(plot.clean)
print(plot.window)

# Save one plot, say plot.clean, as an image file. May adjust px height and width here.
ggsave(paste(getwd(),"/pictures/", paste(groupSubs, electrode, sep="-"), ".png", sep=""), 
       plot.clean, 
       width=10, height=5)