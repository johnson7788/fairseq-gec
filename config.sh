#!/usr/bin/env bash

# 使用的GPU设备
device=0
if [ $# -ge 1 ]; then
    device=$1
fi

#模型名称
exp=''
if [ $# -ge 2 ]; then
    exp=$2
fi

DATA='data' # input dir
OUT='out' # output dir

DATA_BIN=$OUT/data_bin
DATA_RAW=$OUT/data_raw
mkdir -p $DATA_BIN
mkdir -p $DATA_RAW

MODELS=$OUT/models$exp
RESULT=$OUT/result$exp
mkdir -p $MODELS
mkdir -p $RESULT
