# DATA_PATH='/data/Knee_2010_challenge'
DATA_PATH='/scratch/Knee_2010_challenge'

# 1. Convert the SKI10 dataset to corresponding 2D slices and binary masks. 10-fold cross
# validation.    No image preprocessing step.
# cd to mipav installation directory, run mipav command line.   
cd /home/ruida/mipav/
./mipav -p PlugInKneesFemurSegmentationSKI10_nopre -inDir $DATA_PATH/trainData -outDir $DATA_PATH/sk10_nopre   

# 2. Create the 10-fold cross-validation training folder. 
cd $DATA_PATH/sk10_nopre/
sh copy_sag $DATA_PATH

# 3. Generate the train-fold training list for HNN
cd /home/ruida/mipav/
./mipav -p PlugInKneeTrainingListGenerator -inDir $DATA_PATH/sk10_nopre/train_folds  













