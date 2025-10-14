#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=2
#SBATCH --ntasks=1
#SBATCH --time=1:00:00
#SBATCH --job-name=hello
#SBATCH --partition=gpu_h100
#SBATCH --gpus-per-node=1

echo "Hello world!"

