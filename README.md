# Introduction

论文源码: 
**Improving Grammatical Error Correction via Pre-Training a Copy-Augmented Architecture with Unlabeled Data**
Authors: Wei Zhao, Liang Wang, Kewei Shen, Ruoyu Jia, Jingming Liu
Arxiv url: https://arxiv.org/abs/1903.00138
Comments: Accepted by NAACL 2019 (oral)
![](arch.jpg)

## Dependecies
- PyTorch version >= 1.0.0
- Python version >= 3.6


# 中文纠错

## 准备中文数据
data
├── test.src
├── test.trg
├── train.src
├── train.trg
├── valid.src
└── valid.trg

## 处理数据
python preprocess.py --source-lang src --target-lang trg --trainpref data/train --validpref data/valid --destdir out/data --output-format raw

## 开始训练
python train.py out/data --save-dir out/models --seed 4321 --max-epoch 15 --batch-size 64 --max-tokens 3000 --train-subset train --valid-subset valid --arch transformer --lr-scheduler triangular --max-lr 0.004 --lr-period-updates 73328 --clip-norm 2 --lr 0.001 --lr-shrink 0.95 --shrink-min --dropout 0.2 --relu-dropout 0.2 --attention-dropout 0.2 --copy-attention-dropout 0.2 --encoder-embed-dim 512 --decoder-embed-dim 512 --max-target-positions 1024 --max-source-positions 1024 --encoder-ffn-embed-dim 4096 --decoder-ffn-embed-dim 4096 --encoder-attention-heads 8 --decoder-attention-heads 8 --copy-attention-heads 1 --no-progress-bar --log-interval 1000 --positive-label-weight 1.2 --copy-attention --copy-attention-heads 1 --raw-text

## 下载文件
- 下载 CoNLL-2014 评估脚本m2score
```
cd gec_scripts/
sh download.sh
```

- 下载预训练模型 **pre-processed data** & **pre-trained models**
  
  pre-trained model: (Google Drive/Baidu Pan) 
    - url1: https://drive.google.com/file/d/1zewifHUUwvqc2F-MfDRsZFio6PlSzx2c/view?usp=sharing
    - url2: https://pan.baidu.com/s/1hCwQeNFjng_0_NiViJq6fg (code: mxrf)
    
  pre-processed data: (Google Drive)(train/valid/test)， 文件 out.zip
    - url: https://drive.google.com/open?id=17s-TZiM6ilQ-SHklxTUun2Jdgg8B9zS3  

## 英文数据目录格式 out_en目录下
├── data_bin
│   ├── dict.src.txt
│   ├── dict.tgt.txt
│   ├── train.label.src.txt
│   ├── train.label.tgt.txt
│   ├── train.src-tgt.src.bin
│   ├── train.src-tgt.src.idx
│   ├── train.src-tgt.tgt.bin
│   ├── train.src-tgt.tgt.idx
│   ├── valid.label.src.txt
│   ├── valid.label.tgt.txt
│   ├── valid.src-tgt.src.bin
│   ├── valid.src-tgt.src.idx
│   ├── valid.src-tgt.tgt.bin
│   └── valid.src-tgt.tgt.idx
└── data_raw
    ├── dict.src.txt
    ├── dict.tgt.txt
    ├── test.idx
    ├── test.src-tgt.src
    ├── test.src-tgt.src.old
    └── test.src-tgt.tgt

## 用pre-trained model训练, 首先需要下载pre-trained model: (Google Drive/Baidu Pan) 
```
cd fairseq-gec
pip install --editable
sh train.sh \${device_id} \${experiment_name}
```

## 不使用pre-trained model训练, 修改train.sh
- 删除参数  "--pretrained-model" 
- 把epoch改大 "--max-epoch" to 15 (不使用预训练模型需要更多的epoch) 

## Evaluate on the CoNLL-2014 test dataset
```
sh g.sh \${device_id} \${experiment_name}
```

## 从头开始制作预训练模型
如下载部分所述，我们已经公开了我们的预训练模型。
如果有人想从头开始获得预训练的模型，我们在这里列出了步骤。

```
1. # 使用十亿个基准数据集准备目标句子
2. sh noise.sh # 生成还有噪声的原始句子
3. sh preprocess_noise_data.sh # 预处理数据
4. sh pretrain.sh 0,1 _pretrain # 预训练， 0,1参数代表GPU设备，_pretrain表示模型名称
```

## Acknowledgments
Our code was modified from [fairseq](https://github.com/pytorch/fairseq) codebase. We use the same license as fairseq(-py).


## Citation
Please cite as:

```
@article{zhao2019improving,
  title={Improving Grammatical Error Correction via Pre-Training a Copy-Augmented Architecture with Unlabeled Data},
    author={Zhao, Wei and Wang, Liang and Shen, Kewei and Jia, Ruoyu and Liu, Jingming},
      journal={arXiv preprint arXiv:1903.00138},
        year={2019}
}
```


