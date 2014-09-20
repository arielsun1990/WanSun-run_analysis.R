
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

UCI HAR Dataset (Tidy) This repository contains the script used to clean & aggregate the Human Activity Recognition Using Smartphones Data Set.Besides this README file, the repo contains the following:
run_analysis.R. An R script that implements the cleaning & aggregation. 
CodeBook.md. A code book that describes the results. 

The R script performs the following steps to achieve the results:
Download the compressed dataset to a temporary location. 
Decompress the dataset to another temporary location. 
Read the activity & feature mappings from activity_labels.txt & features.txt, respectively. Read & concatenate the subjects (/subject_.txt), activities (/y_.txt), & measurement vectors (/X_.txt) from the training & test subsets. 
Map the activitiy IDs to activity labels. 
Filter down the variables to just the mean & stddev for each measurement. 
Stitch together the subject column, activity label column, & measurement vector. Group the data by subject & activity, using mean for aggregation. Write the new dataset and print its location.

