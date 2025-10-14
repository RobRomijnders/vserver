#!/bin/bash

# hostname --ip-address
# MODEL="facebook/opt-125m"
# MODEL_NAME="opt-125m"
# MAX_MODEL_LEN=1024

# MODEL="gpt2"
# MODEL_NAME="gpt2"
# MAX_MODEL_LEN=1024

export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True


MODEL="facebook/opt-350m"
MODEL_NAME="facebook/opt-350m"
MAX_MODEL_LEN=2048

export VLLM_USE_V1=0
export CUDA_VISIBLE_DEVICES=0  # Use GPU 0 instead of -1

	# --gpu-memory-utilization 0.8 \
	# --max-num-batched-tokens 2048 \

python -m vllm.entrypoints.openai.api_server \
	--model $MODEL \
	--served-model-name $MODEL_NAME \
	--port 8000 \
	--host 0.0.0.0 \
	--trust-remote-code \
	--enforce-eager \
	--max-model-len $MAX_MODEL_LEN \
	--max-num-seqs 256 \
	--max-num-batched-tokens 8192 \
	--disable-log-requests \
	--gpu-memory-utilization 0.9 \
	--tensor-parallel-size 1 \
	--pipeline-parallel-size 1
