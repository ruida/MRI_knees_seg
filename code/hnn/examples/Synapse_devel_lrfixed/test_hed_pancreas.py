# -*- coding: utf-8 -*-
"""
Created on Thu Oct 29 15:03:46 2015

@author: rothhr
"""

import numpy as np
import matplotlib.pyplot as plt
import matplotlib.pylab as pylab
import matplotlib.cm as cm
#%matplotlib inline
#import scipy.misc
import Image
#import scipy.io
import os
import string

# PARAMS
trained_model='/home/rothhr/Code/HED/hed-git/examples/cropped_hed_pancreas_mask_all/hed_pancreas_mask_iter_35000.caffemodel'
# TRAINING
image_root='/home/rothhr/Data/Pancreas/MICCAI2016/PancreasCroppedData/All/img_ax'
test_list_name = '/home/rothhr/Data/Pancreas/MICCAI2016/PancreasCroppedData/All/train_img-label_MASK.lst'
out_dir = '/home/rothhr/Data/Pancreas/MICCAI2016/PancreasCroppedData/All/test_hed_Mask_35000'

############ RUN ###################

# Make sure that caffe is on the python path:
caffe_root = '../../'  # this file is expected to be in {caffe_root}/examples/hed/
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
with open(test_list_name) as f:
    test_lst = f.readlines()

im_lst = []
file_lst = []
for i in range(0, len(test_lst)):
    filename = test_lst[i][0:string.find(test_lst[i],' ')]
    file_lst.append(filename)
    print 'adding file {0} of {1}: {2}'.format(i,len(test_lst),filename)
    im = Image.open(filename)
    in_ = np.array(im, dtype=np.float32)
    in_ = np.expand_dims(in_, axis=2)
    in_ = np.concatenate((in_, in_, in_), axis=2) # make gray to 3 channels
    in_ = in_[:,:,::-1]
    in_ -= np.array((104.00698793,116.66876762,122.67891434))
    im_lst.append(in_)
    
#remove the following two lines if testing with cpu
caffe.set_mode_gpu()
#caffe.set_device(1) 
caffe.set_device(0) 
# load net
model_root = './'
print("load net...")
#trained on abdomen
#net = caffe.Net(model_root+'deploy.prototxt', model_root+'hed_pretrained_bsds.caffemodel', caffe.TEST)
net = caffe.Net(model_root+'deploy.prototxt', trained_model, caffe.TEST)
# standard HED
#model_root = '/home/rothhr/Code/HED/hed-git/examples/hed/'
#net = caffe.Net(model_root+'deploy.prototxt', model_root+'hed_iter_100000.caffemodel', caffe.TEST)
# shape for input (data blob is N x C x H x W), set data
        
for idx in range(0,len(test_lst)):
    print 'image {0} of {1}: {2}'.format(idx,len(test_lst),file_lst[idx])
    
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
