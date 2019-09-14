
mkdir result test map train train_folds

for dir in result test map train train_folds; do
   mkdir -p "$dir"/fold1/axial "$dir"/fold1/coronal "$dir"/fold1/sagittal
   mkdir -p "$dir"/fold2/axial "$dir"/fold2/coronal "$dir"/fold2/sagittal
   mkdir -p "$dir"/fold3/axial "$dir"/fold3/coronal "$dir"/fold3/sagittal
   mkdir -p "$dir"/fold4/axial "$dir"/fold4/coronal "$dir"/fold4/sagittal   
   mkdir -p "$dir"/fold5/axial "$dir"/fold5/coronal "$dir"/fold5/sagittal
   mkdir -p "$dir"/fold6/axial "$dir"/fold6/coronal "$dir"/fold6/sagittal
   mkdir -p "$dir"/fold7/axial "$dir"/fold7/coronal "$dir"/fold7/sagittal
   mkdir -p "$dir"/fold8/axial "$dir"/fold8/coronal "$dir"/fold8/sagittal
   mkdir -p "$dir"/fold9/axial "$dir"/fold9/coronal "$dir"/fold9/sagittal
   mkdir -p "$dir"/fold10/axial "$dir"/fold10/coronal "$dir"/fold10/sagittal   
done

