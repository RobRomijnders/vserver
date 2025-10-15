#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --ntasks=1
#SBATCH --time=1:00:00
#SBATCH --job-name=hello
#SBATCH --partition=gpu_a100
#SBATCH --gpus-per-node=1

# PYTHON=/home/rromijnders/projects/vllm/vserver/.venv/bin/python3

module load 2023
module load CUDA/12.1.1
# module load Python/3.11.3-GCCcore-12.3.0 CUDA/12.1.1


# Enable vLLM V1 engine
export VLLM_USE_V1=1


# source /home/rromijnders/projects/vllm/vserver/.venv/bin/activate
# uv run bash run.sh

# uv venv --python 3.11 --seed --clear
source .venv/bin/activate
# uv pip install vllm --torch-backend=auto

uv run bash /home/rromijnders/projects/vllm/vserver/run.sh


echo "Hello world!"

