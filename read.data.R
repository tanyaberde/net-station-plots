# Read the raw data text outs you exported from Net Station

## Extract data, assign each condition text file to an object
cond1.data <- read.delim("text outs/BD-cells-face_ComplyReward, Ave.xls", header=F) ###
cond2.data <- read.delim("text outs/BD-cells-face_ComplyPunish, Ave.xls", header=F) ###
cond3.data <- read.delim("text outs/BD-cells-face_ViolateReward, Ave.xls", header=F) ###
cond4.data <- read.delim("text outs/BD-cells-face_ViolatePunish, Ave.xls", header=F) ###
#cond5.data <- read.delim("text outs/Faces-501_Neutral, Ave.txt", header=F) ###

## What is your time window? 0 ms point is your event
prestim = -200; poststim = 800 ###

# Assign time every 4 ms to object, these will be rows
time.window <- seq(prestim+4, poststim, by=4)

# Assign channel names, these will be 129 columns
hydrocel.channels <- seq(1,129)

# Cast the rows and columns into each of your datafiles
names(cond1.data) <- hydrocel.channels
names(cond2.data) <- hydrocel.channels
names(cond3.data) <- hydrocel.channels
names(cond4.data) <- hydrocel.channels
#names(cond5.data) <- hydrocel.channels

cond1.data$ms = time.window
cond2.data$ms = time.window
cond3.data$ms = time.window
cond4.data$ms = time.window
#cond5.data$ms = time.window