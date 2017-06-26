### Data Set- Study Design

This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

### Processing of the Data
#### Feature Selection
The original set of features for the Smartphones Data Set total 561.  The features selected for the run_analytics R script pertain to the mean and standard deviation measurements, which total 66 features.

#### Tidying the Data
Using the "features.txt" file, features names were used as the column names in the "X_train.txt" and "X_test.txt" files.  The numerical activity values in the "Y_train.txt" and "Y_test.txt" files were translated to their respective activity labels, from the "activity_labels.txt" file

#### Data Description
After the feature selection, the data set was reduced to the following features.

1. subject - an integer identifier
2. activity - a string representing one of the following activities:
  * WALKING, 
  * WALKING_UPSTAIRS, 
  * WALKING_DOWNSTAIRS, 
  * SITTING, 
  * STANDING, 
  * LAYING
3. time and frequency variables for the mean and standard deviation of the following:
  * body acceleration triaxial  
  * body acceleration jerk triaxial 
  * body acceleration magnitude triaxial
  * body acceleration jerk magnitude triaxial
  * body gyroscope triaxial 
  * body gyroscope jerk triaxial
  * body gyroscope magnitude triaxial
  * body accerlation jerk magnitude
  * body gryoscope magnitude
  * body gryoscope jerk magnitude
  * body body accerlation jerk magnitude
  * body body gryoscope magnitude
  * body body gryoscope jerk magnitude
  * gravity acceleration triaxial
··* gravity acceleration magnitude
