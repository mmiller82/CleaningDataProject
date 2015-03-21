---
title: "README"
output: html_document
---

This repository contains artifacts for the Coursera Cleaning Data class project.  There is this README, a code book which describes the variables in the final data set and a the R script run_Analysis.R which transforms data taken from the website http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones into a tidy data set.
The website states the data contains 10299 observations (instances) of 561 variables (attributes).  
The data was reduced to 10299 observations of 59 variables and then aggregated to 180 observations.
There are measurements by accelerometer and gyroscope in the data set.  The accelerometer measurements are designated by Acc and
the gyroscope measurements are designated by Gyro in the column name.
The R script begins by reading variable names for features and activities. It reads the train data and extracts the
required measurements. It reads the test data and extracts the required measurements. Then, the script loads the label data
for test and train measurements.  In the next step the script combines the train set measurements and labels into
a dataframe and combines the test set measurements and labels into a dataframe. After this a dataframe that combines the
train and test data is created and its columns names are modified to easier to read names. Lastly, the data is aggregated into a data set of the average of each variable by activity and subject.
The aggregated data is written to the file aggdata.txt.

