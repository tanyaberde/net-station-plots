# Plot waves separated by condition for each montage you computed in averages.R

## Set your format preferences. Might need to see see mont*.plot first to eyeball
lower.volt=-2.5 ### 
upper.volt=1.5 ###
volt.by=0.5 ### How much should voltage limits skip?
wavethick=1.5 ### How thick should the waves be?

require(ggplot2)

# Basic graphs, may need to edit y variable names to match condition names 
mont1.plot <- ggplot(mont1.table, aes(ms)) + 
  geom_line(aes(y = CongruentReward, colour = "CongruentReward"), size=wavethick) + ###
  geom_line(aes(y = IncongruentReward, colour = "IncongruentReward"), size=wavethick) + ###
  geom_line(aes(y = CongruentPunish, colour = "CongruentPunish"), size=wavethick) + ###
  geom_line(aes(y = IncongruentPunish, colour = "IncongruentPunish"), size=wavethick) ###
# +  geom_line(aes(y = cond5, colour = "cond5"), size=linesize) ###

# Standard themes and formatting added onto basic graph, no need to edit anything here except maybe color palette
mont1.plot.final <- mont1.plot +
  geom_hline(x=0) + geom_vline(y=0) +
  ylab("uV") + 
  scale_x_continuous(breaks=seq(prestim,poststim,100), limits=c(prestim+50,poststim-50)) +
  scale_y_continuous(breaks=seq(lower.volt,upper.volt,volt.by), limits=c(lower.volt, upper.volt)) +
  theme(aspect.ratio=.5) + # Makes y-axis half as long as x-axis
  theme(legend.title=element_blank()) + # Remove title for all legends
  scale_colour_brewer(type="div", palette=2) # Neat auto colors 

# Save plot as a png file. May adjust px resolution here.
png(filename="mont1.plot.final.png", width=800, height=400, units="px")
print(mont1.plot.final)
dev.off()