#!/bin/bash

jupyter notebook --allow-root &
tensorboard --logdir=/tensorboard --host=0.0.0.0
