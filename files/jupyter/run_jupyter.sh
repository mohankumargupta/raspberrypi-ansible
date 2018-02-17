#!/bin/bash

jupyter notebook --allow-root &
tensorboard --logdir=/notebooks/logs --host=0.0.0.0
