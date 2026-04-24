#!/bin/bash

CHECKPOINT_PATH="/home/peraro/source/play-openvla/checkpoints/openvla-7b-prismatic/checkpoints/step-295000-epoch-40-loss=0.2200.pt" # TODO: fixme
DATASET_ROOT="/home/peraro/source/play-rlds/datasets/rlds/rl_bench_builder"
LOG_DIR="/home/peraro/source/play-openvla/logs"

export WANDB_MODE=disabled

torchrun --standalone --nnodes 1 --nproc-per-node 1 openvla/vla-scripts/train.py \
  --pretrained_checkpoint $CHECKPOINT_PATH \
  --vla.type prism-dinosiglip-224px+mx-bridge \
  --data_root_dir $DATASET_ROOT \
  --run_root_dir $LOG_DIR \
  --save_interval 1000 \
  --is_resume False
#
#  --run_id <OPTIONAL RUN ID FOR WANDB LOGGING> \
#  --image_aug <True or False> \
#  --wandb_project <PROJECT> \
#  --wandb_entity <ENTITY> \