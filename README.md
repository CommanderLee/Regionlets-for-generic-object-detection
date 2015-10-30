# Regionlets-for-generic-object-detection

This folder contains following files:

1) main.m
Description: This file is the starting file for our project. This file reads the images from the positive training set and also the annotation files which has the details about bounding boxes.

2) annotation.m
Description: This file reads the annotation file for an image and notes the bounding boxes coordinates in “Locations” array for further processing.

3) imcropper.m
Description: This file on input from the annotation.m takes the coordinates for the bounding box and virtually takes the portion of the image enclosed in the bounding box for further processing.

4)positive_hog.m
Description: This file creates sliding window regions with overlap given in the main file and regionlets at random positions as given in the main file for positive images and then concatenates them into a single column for each bounding box.

5)negative_hog.m
Description: This file creates regionlets at random positions as given in the main file for positive images and then concatenates them into a single column for each bounding box.

6)trainer.m
Description: This file uses GentleAdaboost provided by GMLAdaboost Toolbox by Alexander Vezhnevets. It uses a decision tree as weak learner.

7)classify.m
Description: This file is used to simulate the testing phase of the project and this is a simple interactive file.

Processing status:
main.m—>annotation.m—>imcropper.m—>positive_hog.m—>negative_hog.m—>trainer.m—>classify.m


Variables:
size_of_region : It determines the the size of a region considered in the project and it should be an nXn region(square) only.
over_lap: It determines the amount of overlap you wish to consider for the regions.

Note:  After classification, the results are displayed and for the positive set of images consider the "accuracy" value and for the negative images consider the "error" value as an accuracy value.

