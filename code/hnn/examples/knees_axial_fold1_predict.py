# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.pylab as pylab
import matplotlib.cm as cm
from PIL import Image
import os
import string

def recursive_glob(searchroot='.', searchstr=''):
    print("search for {0} in {1}".format(searchstr,searchroot))
    return [os.path.join(rootdir, filename)
        for rootdir, dirnames, filenames in os.walk(searchroot)
        for filename in filenames if searchstr in filename]    

# MODEL
model_root = '/data/ruida/hed-globalweight/examples/knees_axial_fold1'
trained_model='hed_prostate_mask_iter_92000.caffemodel'

# TESTING
image_root='/data/ruida/knees/test_femur_extra_fold/axial'
out_dir = '/data/ruida/knees/femur_map_extra/axial'


############ RUN ###################
if os.path.isabs(trained_model):
    model_root = os.path.dirname(trained_model)
    trained_model = os.path.basename(trained_model)

# Make sure that caffe is on the python path:
caffe_root = '../'  # this file is expected to be in {caffe_root}/examples/.
import sys
sys.path.insert(0, caffe_root + 'python')

import caffe

#Visualization
def plot_single_scale(scale_lst, size):
    pylab.rcParams['figure.figsize'] = size, size/2
    
    plt.figure()
    for i in range(0, len(scale_lst)):
        s=plt.subplot(1,5,i+1)
        plt.imshow(1-scale_lst[i], cmap = cm.Greys_r)
        s.set_xticklabels([])
        s.set_yticklabels([])
        s.yaxis.set_ticks_position('none')
        s.xaxis.set_ticks_position('none')
    plt.tight_layout()

### MAIN ####
im_lst = []
file_lst = recursive_glob(image_root,'.png')
for i in range(0, len(file_lst)):
    filename = file_lst[i]
    print 'adding file {0} of {1}: {2}'.format(i,len(file_lst),filename)
    im = Image.open(filename)
    in_ = np.array(im, dtype=np.float32)
    in_ = np.expand_dims(in_, axis=2)
    in_ = np.concatenate((in_, in_, in_), axis=2) # make gray to 3 channels
    in_ = in_[:,:,::-1]
    in_ -= np.array((104.00698793,116.66876762,122.67891434))
    im_lst.append(in_)
    
#remove the following two lines if testing with cpu
caffe.set_mode_gpu()
caffe.set_device(1) 
#caffe.set_device(0) 
# load net
print("load net...")
#trained on knees
net = caffe.Net(model_root+'/deploy.prototxt', model_root+'/'+trained_model, caffe.TEST)
# standard HED
#net = caffe.Net(model_root+'deploy.prototxt', model_root+'hed_iter_100000.caffemodel', caffe.TEST)
# shape for input (data blob is N x C x H x W), set data
        
for idx in range(0,len(file_lst)):
    print 'image {0} of {1}: {2}'.format(idx,len(file_lst),file_lst[idx])
    
    in_ = im_lst[idx]
    in_ = in_.transpose((2,0,1))
    
    net.blobs['data'].reshape(1, *in_.shape)
    net.blobs['data'].data[...] = in_
    # run net and take argmax for prediction
    print("  run net...")
    net.forward()
    out1 = net.blobs['sigmoid-dsn1'].data[0][0,:,:]
    out2 = net.blobs['sigmoid-dsn2'].data[0][0,:,:]
    out3 = net.blobs['sigmoid-dsn3'].data[0][0,:,:]
    out4 = net.blobs['sigmoid-dsn4'].data[0][0,:,:]
    out5 = net.blobs['sigmoid-dsn5'].data[0][0,:,:]
    fuse = net.blobs['sigmoid-fuse'].data[0][0,:,:]
    
    # save results
    filename=file_lst[idx].replace(image_root,out_dir)
    curr_out_dir = os.path.dirname( filename )
    if not os.path.exists(curr_out_dir):    
        os.makedirs(curr_out_dir)
    print("[{}, {}]".format(np.min(out1),np.max(out1)))
    im_ = Image.fromarray((out1 * 255).astype(np.uint8))
    im_.save(filename.replace('.png','-sigmoid-dsn1.png'))
 
    im_ = Image.fromarray((out2 * 255).astype(np.uint8))
    im_.save(filename.replace('.png','-sigmoid-dsn2.png'))
    
    im_ = Image.fromarray((out3 * 255).astype(np.uint8))
    im_.save(filename.replace('.png','-sigmoid-dsn3.png'))
    
    im_ = Image.fromarray((out4 * 255).astype(np.uint8))
    im_.save(filename.replace('.png','-sigmoid-dsn4.png'))

    im_ = Image.fromarray((out5 * 255).astype(np.uint8))
    im_.save(filename.replace('.png','-sigmoid-dsn5.png'))

    im_ = Image.fromarray((fuse * 255).astype(np.uint8))
    im_.save(filename.replace('.png','-sigmoid-fuse.png'))   

    print '  saved results in {0}'.format(out_dir)
   
    #print("visualize...")
    #scale_lst = [fuse]
    #plot_single_scale(scale_lst, 22)
    #scale_lst = [out1, out2, out3, out4, out5]
    #plot_single_scale(scale_lst, 10)    
