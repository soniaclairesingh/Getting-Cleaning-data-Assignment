This repository contains 2 main files:

1. CodeBook
2. run_analysis.R

=========================================
Description
=========================================
The R script uses data acquired by by Davide Anguita and colleagues (2012), in their study
titled 'Human Activity Recognition on Smartphones using a Multiclass
Hardware-Friendly Support Vector Machine published in International Workshop
of Ambient Assisted Living (IWAAL 2012)'. Vitoria-Gasteiz, Spain. Dec 2012.

-The dataset comprises of recordings of 30 subjects performing activities of daily living   (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

-Each person performed six activities (WALKING, WALKING_UPSTAIRS,
 WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone.

Files provide the following information:
========================================
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 
=========================================
**IMPORTANT**
-Make sure the folder 'UCI HAR Dataset' is present in your working
directory before running the R file.
-Make sure the specified file path is accurate
-The dataset can be found using the link below: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip] 

**run_analysis.R**
-The name of the output file is 'tidy_data_set.txt'
-The output file will be generated in the working directory is set as mentioned in the R file
-An explanation is provided in the supplemental CodeBook document.
=========================================
Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.

