# Copyright (c) Microsoft Corporation.
# Licensed under the MIT license.

# please use 4 GPU
task=tacred
GPU='0,1,2,3'
CUDA_VISIBLE_DEVICES=$GPU python examples/run_finetune_TACRED_adapter.py \
    --model_type roberta \
    --model_name_or_path roberta-large \
    --config_name roberta-large \
    --do_train  \
    --do_eval   \
    --no_cuda  \
    --task_name=$task     \
    --data_dir=/home/ubuntu/data/  \
    --output_dir=./proc_data  \
    --comment 'combine-adapter-dif-trf' \
    --max_seq_length=350  \
    --per_gpu_eval_batch_size=8   \
    --per_gpu_train_batch_size=8   \
    --learning_rate=5e-6 \
    --gradient_accumulation_steps=1 \
    --num_train_epochs=5     \
    --model_name=roberta-large  \
    --overwrite_output_dir   \
    --overwrite_cache \
    --warmup_steps=1000 \
    --negative_sample=45000 \
    --save_steps=500 \
    --freeze_bert="" \
    --freeze_adapter="True" \
    --adapter_size 768 \
    --adapter_list "0,11,22" \
    --adapter_skip_layers 0 \
    --meta_fac_adaptermodel="./pretrained_models/fac-adapter/pytorch_model.bin" \
    --meta_lin_adaptermodel="./pretrained_models/lin-adapter/pytorch_model.bin"
