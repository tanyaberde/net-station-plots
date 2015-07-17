# Average over a montage per condition

require(plyr)
require(dplyr)

### What is your montage?
mont1 <- c(15,23,18,16,10,3,24,19,11,4,124,20,12,5,118,13,6,112) ###

# Compute average over montage 1 in each condition
mont1.ave.cond1 <- rowMeans(subset(cond1.data, select=mont1))
mont1.ave.cond2 <- rowMeans(subset(cond2.data, select=mont1))
mont1.ave.cond3 <- rowMeans(subset(cond3.data, select=mont1))
mont1.ave.cond4 <- rowMeans(subset(cond4.data, select=mont1))
#mont1.ave.cond5 <- rowMeans(subset(cond5.data, select=mont1))

# Cast each average into a new table with ms
mont1.table <- data.frame(mont1.ave.cond1, 
                           mont1.ave.cond2, 
                           mont1.ave.cond3, 
                           mont1.ave.cond4 
#                            mont1.ave.cond5
                           )

mont1.table$ms = time.window

# If you want, you can change condition names here
names(mont1.table)[names(mont1.table)=="mont1.ave.cond1"] <- "CongruentReward" ###
names(mont1.table)[names(mont1.table)=="mont1.ave.cond2"] <- "IncongruentReward" ###
names(mont1.table)[names(mont1.table)=="mont1.ave.cond3"] <- "CongruentPunish" ###
names(mont1.table)[names(mont1.table)=="mont1.ave.cond4"] <- "IncongruentPunish" ###
#names(mont1.table)[names(mont1.table)=="mont1.ave.cond5"] <- "cond5" ###