# Variables created in the Script

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

The structure of the **data.final** is: the first column indicates the subject, the second column is the activity and the next columns is the combination of:

Signals ('-XYZ' is used to denote 3-axial signals in the X, Y and Z directions). 

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

Then, the set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean