# Quickie ERP Plots
Because clicking things on Excel takes too long and is prone to human error

---

**Purpose:** Visualize ERP waveforms after processing on Net Station and before performing statistical analyses

**Input:** Tab-delimited text/xls files exported from Net Station 5

**Output:** An overplot of ERPs over a specified montage

---

## To do
1. Open `net station plots.Rproj` on RStudio
2. Source/Run the three R scripts in the sequence defined below

## Script sequence
1. read.data.R
2. averages.R
3. waveplots.R


## Good to know
1. Lines with three pound signs `###` indicate input fields
2. In the example, each text file is a header-less matrix representing voltage measures from 129 channels over a time window spanning 200 ms prestimulus to 800 ms poststimulus, in one experimental condition. There are four conditions.
3. This project does not do stats. Just viz.
4. Code will keep changing.


