---
title: "Getting and Cleaning Data Project"
author: "Harish Krishnan"
date: "Sunday, February 22, 2015"
output: html_document
---

Repo for the submission of the course project for the Johns Hopkins Getting and Cleaning Data course.

### Overview

The data from [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) has been used to demonstrate the functions that R has to get and clean data from multiple sources/tables. 

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### General Info

run_analysis.R, the R script that I have written employs "dplyr" and  "tidyr" package. These packages help handling the data in a easier and effiecient way. 

### Project Synopsis

1. step 1 - merging the data.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately label the data set with descriptive variable names. 
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 