#!/bin/bash

# hostname --ip-address
MODEL="facebook/opt-125m"
MODEL_NAME="opt-125m"

MODEL="mistralai/Mistral-7B-v0.3"
MODEL_NAME="mistralai/Mistral-7B-v0.3"

MODEL="gpt2"
MODEL_NAME="gpt2"

export VLLM_USE_V1=0
export CUDA_VISIBLE_DEVICES=0  # Use GPU 0 instead of -1

python -m vllm.entrypoints.openai.api_server \
	        --model $MODEL \
		        --served-model-name $MODEL_NAME \
			        --port 8000 \
				        --host 0.0.0.0 \
					        --trust-remote-code \
						        --enforce-eager \
							        --max-model-len 1024
