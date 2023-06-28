## Runpod.io 部署

### 检查本地的Pytorch 以及 Cuda的版本

nvcc --version

```
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2022 NVIDIA Corporation
Built on Wed_Jun__8_16:49:14_PDT_2022
Cuda compilation tools, release 11.7, V11.7.99
Build cuda_11.7.r11.7/compiler.31442593_0
```

python -c "import torch; print(torch.__version__)"

```
2.0.1+cu117
```

### 获取代码、模型和数据

#### 代码

cd /workspace/
git clone https://github.com/lm-sys/FastChat

cd FastChat
pip3 install --upgrade pip
pip3 install -e .
pip3 install einops
pip3 install flash_attn==1.0.5


#### 模型

cd /workspace/

apt-get install git-lfs
git lfs install
git clone https://huggingface.co/huggyllama/llama-7b

```
Encountered 2 file(s) that may not have been copied correctly on Windows:
        pytorch_model-00001-of-00002.bin
        model-00001-of-00002.safetensors

See: `git lfs help smudge` for more details.
```

以上报错可以忽略，只是对Windows下的git lfs会有影响

#### 数据

git clone https://huggingface.co/datasets/ehartford/wizard_vicuna_70k_unfiltered


### 启动模型训练

参见 training_dummy.sh 以及 training_model.sh
