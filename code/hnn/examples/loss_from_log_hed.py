#!/usr/bin/env python

from __future__ import print_function
import sys
import re
import numpy as np
import matplotlib.pyplot as plt
import cPickle as pickle
import os

from utils import strstr

def main():
  log_files = ['/hnn/examples/knees_sagittal_fold1/knees_sagittal_fold1.log']

  train_iteration = []
  train_loss      = []
  base_test_iter  = 0
  base_train_iter = 0

  for log_file in log_files:
    with open(log_file, 'rb') as f:
      if len(train_iteration) != 0:
        base_train_iter = train_iteration[-1]
        base_test_iter = test_iteration[-1]

      line_count = 0
      for line in f:
        line_count += 1  
        #print('{}: {}'.format(line_count, line))
        # TRAIN NET
        if strstr(line, 'Iteration') and strstr(line, 'lr'):
          matched = match_iteration(line)
          train_iteration.append(int(matched.group(1))+base_train_iter)

        elif strstr(line, ', loss'):
          matched = match_loss(line)
          print(matched.group(1))
          train_loss.append(float(matched.group(1)))

  log_base = os.path.splitext(os.path.basename(log_files[0]))[0]
 
  result = {'TRAIN': (train_iteration,train_loss)}
  pickle.dump( result , open( log_base+'.pkl', "wb" ) )

  print('read {} lines'.format(line_count))
  print("TRAIN", train_iteration, train_loss, np.shape(train_iteration), np.shape(train_loss))
  
  print("Best TRAIN performance at:")
  min_train_loss = np.min(train_loss)
  best_idx = np.where(train_loss==min_train_loss)[0]
  print(best_idx)
  print("{}: iteration {}, loss {}".format(log_base,train_iteration[best_idx],min_train_loss))

  # loss
  #plt.plot(train_iteration[0:len(train_loss)], train_loss[0:len(train_loss)], 'k', label='Train loss')
  plt.semilogy(train_iteration[0:len(train_loss)], train_loss[0:len(train_loss)], 'k', label='Train loss')
  plt.legend()
  plt.ylabel('Loss')
  plt.xlabel('Number of iterations')
  plt.grid(True)
  plt.show()
  plt.savefig(log_base+'.png')

def match_iteration(line):
  return re.search(r'Iteration (.*),', line)

def match_loss(line):
  return re.search(r'loss = (.*),', line)

def match_accuracy(line):
  return re.search(r'seg-accuracy = (.*),', line)

def process_arguments(argv):
  print(argv)
  if len(argv) < 2:
    help()

  log_files = argv[1:]
  return log_files

def help():
  print('Usage: python loss_from_log.py [LOG_FILE]+\n'
        'LOG_FILE is text file containing log produced by caffe.'
        'At least one LOG_FILE has to be specified.'
        'Files has to be given in correct order (the oldest logs as the first ones).'
        , file=sys.stderr)

  exit()

if __name__ == '__main__':
  main()
