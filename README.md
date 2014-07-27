---
title: "README"
output: html_document
---

This repository contains artifacts for the project in the Coursera cleaning data class.  There is this README, a code book and a R script run_Analysis which transforms data taken from this website http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones into a tidy data set.
The R script begins by reading variable names for features and activities. It reads the train data and extracts the
required measurements. It reads the test data and extracts the required measurements and it gets the data
for test and train subjects and activities.  The next step in the script is combining all the train set data into
a dataframe and combining all the test set related data into a dataframe. After this a dataframe that combines the
train and test data is created. Lastly, this data is aggregated into a tidy data set of means by activity and subject.

