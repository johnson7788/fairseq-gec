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

## 下载文件
- 下载 CoNLL-2014 评估脚本
```
cd gec_scripts/
sh download.sh
```

- 下载预训练模型 **pre-processed data** & **pre-trained models**
  
  pre-trained model: (Google Drive/Baidu Pan) 
    - url1: https://drive.google.com/file/d/1zewifHUUwvqc2F-MfDRsZFio6PlSzx2c/view?usp=sharing
    - url2: https://pan.baidu.com/s/1hCwQeNFjng_0_NiViJq6fg (code: mxrf)
    
  pre-processed data: (Google Drive)(train/valid/test)
    - url: https://drive.google.com/open?id=17s-TZiM6ilQ-SHklxTUun2Jdgg8B9zS3  

## 用pre-trained model训练
```
cd fairseq-gec
pip install --editable
sh train.sh \${device_id} \${experiment_name}
```

## 不使用pre-trained model训练, 修改train.sh
- delete parameter "--pretrained-model" 
- change the value of "--max-epoch" to 15 (more epochs are needed without pre-trained parameters) 

## Evaluate on the CoNLL-2014 test dataset
```
sh g.sh \${device_id} \${experiment_name}
```

## Get pre-trained models from scratch, 从头开始制作预训练模型
如下载部分所述，我们已经公开了我们的预训练模型。
如果有人想从头开始获得预训练的模型，我们在这里列出了步骤。

```
1. # prepare target sentences using one billion benchmark dataset
2. sh noise.sh # generate the noised source sentences 
3. sh preprocess_noise_data.sh # preprocess data
4. sh pretrain.sh 0,1 _pretrain # pretrain 
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


