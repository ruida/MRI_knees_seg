# DATA_PATH='/data/Knee_2010_challenge'
DATA_PATH='/scratch/Knee_2010_challenge'

# Training the 10-fold models by using HNN. i.e. training fold-1, one-fold training time is around 2 days. 
cd ../../code/hnn/examples/knees_sagittal_fold1

# Change the training fold input data path
# You need to specify the src data path string and the replaced data path string here. 
sed -i 's#/data/ruida/knees/trainFold/0_10/sagittal.lst#/scratch/Knee_2010_challenge/sk10_nopre/train_folds/fold1/sagittal.lst#g' train_val_knee.prototxt

python solve_knee.py
