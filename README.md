# Getting and Cleaning Data Course Project of Coursera

The script run_analysis.R includes all the steps needed to process the data.
Inside you can find the following variables defined:  
- x.test.raw: the test observations as were in the source file.  
- y.test.raw: activities associated to the test observations as were in the source file.  
- subject.test.raw: subject for which the test observations belongs to.  
- x.train.raw: the train observations as were in the source files.  
- y.train.raw: activities associated to the train observations as were in the source file.  
- subject.train.raw: subject for which the train observations belongs to.  
- activities: mapping of the activity factors.  
- merge.raw: a data frame with the merge of test, train and activity data.  
- merge.filtered: a data frame with the data that is in the mean and the standard deviation.  
- **data.final**: final data set required for the project.  

Also you can find the following functions:
- load_data: loads the data from the source files in the corresponding variables.
- merge_data: merge the data sets with the loaded data.
- filter_data: filter the data that is out of the mean and the standard deviation.
- **generate_tidy_data**: invokes all the functions above, generates the data.final data set and persist that data set in the data.final.txt file.

After sourcing this script you must run the function **generate_tidy_data**.
The script needs the folder **UCI HAR Dataset** in the working directory.