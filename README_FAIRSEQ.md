# Introduction <img src="fairseq_logo.png" width="50"> 

Fairseq（-py）是一个序列建模工具包，
研究人员和开发人员可以使用它们来训练定制模型，
以进行翻译，摘要，语言建模和其他文本生成任务。 
它提供了各种序列到序列模型的参考实现，包括：
- **Convolutional Neural Networks (CNN)**
  - [Dauphin et al. (2017): Language Modeling with Gated Convolutional Networks](examples/conv_lm/README.md)
  - [Gehring et al. (2017): Convolutional Sequence to Sequence Learning](examples/conv_seq2seq/README.md)
  - [Edunov et al. (2018): Classical Structured Prediction Losses for Sequence to Sequence Learning](https://github.com/pytorch/fairseq/tree/classic_seqlevel)
  - [Fan et al. (2018): Hierarchical Neural Story Generation](examples/stories/README.md)
- **LightConv and DynamicConv models**
  - **_New_** [Wu et al. (2019): Pay Less Attention with Lightweight and Dynamic Convolutions](examples/pay_less_attention_paper/README.md)
- **Long Short-Term Memory (LSTM) networks**
  - [Luong et al. (2015): Effective Approaches to Attention-based Neural Machine Translation](https://arxiv.org/abs/1508.04025)
  - [Wiseman and Rush (2016): Sequence-to-Sequence Learning as Beam-Search Optimization](https://arxiv.org/abs/1606.02960)
- **Transformer (self-attention) networks**
  - [Vaswani et al. (2017): Attention Is All You Need](https://arxiv.org/abs/1706.03762)
  - [Ott et al. (2018): Scaling Neural Machine Translation](examples/scaling_nmt/README.md)
  - [Edunov et al. (2018): Understanding Back-Translation at Scale](examples/backtranslation/README.md)
  - **_New_** [Shen et al. (2019) Mixture Models for Diverse Machine Translation: Tricks of the Trade](examples/translation_moe/README.md)

Fairseq功能：
- 一台机器或多台机器上的多GPU（分布式）训练
- 通过实现多种搜索算法，在CPU和GPU上快速生成：
   -beam search
   -Diverse beam search（[Vijayakumar et al。，2016]（https://arxiv.org/abs/1610.02424））
   -采样（无限制和前k个）
-通过延迟更新，即使在单个GPU上，也可以进行大型的小批量培训
-快速半精度浮点（FP16）培训
-可扩展：轻松注册新模型，标准，任务，优化器和学习率调度器

We also provide [pre-trained models](#pre-trained-models-and-examples) for several benchmark
translation and language modeling datasets.

![Model](fairseq.gif)

# Requirements and Installation
* A [PyTorch installation](http://pytorch.org/)
* For training new models, you'll also need an NVIDIA GPU and [NCCL](https://github.com/NVIDIA/nccl)
* Python version 3.6

目前fairseq需要PyTorch版本  >= 1.0.0.
Please follow the instructions here: https://github.com/pytorch/pytorch#installation.

如果您使用Docker，请确保通过以下任一方法增加共享内存大小
`--ipc=host` or `--shm-size` as command line options to `nvidia-docker run`.

安装PyTorch之后，您可以使用以下命令安装fairseq  `pip`:
```
pip install fairseq
```

**Installing from source**

从源代码安装fairseq并在本地开发:
```
git clone https://github.com/pytorch/fairseq
cd fairseq
pip install --editable .
```

# Getting Started

The [full documentation](https://fairseq.readthedocs.io/) 包含有关入门，训练新模型以及使用新模型类型和任务扩展fairseq的说明。

# Pre-trained models and examples

我们为以下列出的几个任务提供了经过预训练的模型和经过预处理的二分类测试集，以及样本性的训练和评估命令。

- [Translation](examples/translation/README.md): convolutional and transformer models are available
- [Language Modeling](examples/language_model/README.md): convolutional models are available

我们还提供了更详细的 READMEs, 以重现特定论文的结果：
- [Shen et al. (2019) Mixture Models for Diverse Machine Translation: Tricks of the Trade](examples/translation_moe/README.md)
- [Wu et al. (2019): Pay Less Attention with Lightweight and Dynamic Convolutions](examples/pay_less_attention_paper/README.md)
- [Edunov et al. (2018): Understanding Back-Translation at Scale](examples/backtranslation/README.md)
- [Edunov et al. (2018): Classical Structured Prediction Losses for Sequence to Sequence Learning](https://github.com/pytorch/fairseq/tree/classic_seqlevel)
- [Fan et al. (2018): Hierarchical Neural Story Generation](examples/stories/README.md)
- [Ott et al. (2018): Scaling Neural Machine Translation](examples/scaling_nmt/README.md)
- [Gehring et al. (2017): Convolutional Sequence to Sequence Learning](examples/conv_seq2seq/README.md)
- [Dauphin et al. (2017): Language Modeling with Gated Convolutional Networks](examples/conv_lm/README.md)

# Join the fairseq community

* Facebook page: https://www.facebook.com/groups/fairseq.users
* Google group: https://groups.google.com/forum/#!forum/fairseq-users

# License
fairseq(-py) is BSD-licensed.
The license applies to the pre-trained models as well.
We also provide an additional patent grant.

# Credits
This is a PyTorch version of
[fairseq](https://github.com/facebookresearch/fairseq), a sequence-to-sequence
learning toolkit from Facebook AI Research. The original authors of this
reimplementation are (in no particular order) Sergey Edunov, Myle Ott, and Sam
Gross.
