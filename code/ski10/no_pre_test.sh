# DATA_PATH='/data/Knee_2010_challenge'
DATA_PATH='/scratch/Knee_2010_challenge'

# Training the 10-fold models by using HNN. i.e. training fold-1, one-fold training time is around 2 days. 
cd ../../code/hnn/examples

# Change the training fold input data path
# Replace the path string for trained caffemodel directory, the test image directory, the the prediction map output directory. 

sed -i 's#/data/ruida/hed-globalweight/examples/knees_sagittal_fold1#/scratch/Knee_2010_challenge/hnn/examples/knees_sagittal_fold1#g' knees_sagittal_fold1_predict.py

sed -i 's#hed_prostate_mask_iter_66000.caffemodel#hed_knee_mask_iter_61000.caffemodel#g' knees_sagittal_fold1_predict.py

sed -i 's#/data/ruida/knees/test_femur_extra_fold/sagittal#/scratch/Knee_2010_challenge/sk10_nopre/test/fold1/sagittal#g' knees_sagittal_fold1_predict.py

sed -i 's#/data/ruida/knees/femur_map_extra/sagittal#/scratch/Knee_2010_challenge/sk10_nopre/map/fold1/sagittal#g' knees_sagittal_fold1_predict.py

python knees_sagittal_fold1_predict.py


# Generate the VOI contours from the predicted maps
cd /home/ruida/mipav

./mipav -p PlugInSK10_MRI_map_nopre -inDirImage $DATA_PATH/train_data_no_pre/sagittal/ -inDirMap $DATA_PATH/sk10_nopre/map/fold1/sagittal/ -outDir $DATA_PATH/sk10_nopre/result/fold1/sagittal/  





