cd /workspace/FastChat

apt-get install screen

screen -S training_session
export WANDB_API_KEY=YOUR_WANDB_API_KEY
torchrun --nproc_per_node=4 --master_port=20001 fastchat/train/train_mem.py \
    --model_name_or_path  /workspace/llama-7b  \
    --data_path /workspace/wizard_vicuna_70k_unfiltered/wizard_vicuna_dataset_unfiltered.json \
    --bf16 True \
    --output_dir /workspace/vicuna_demo \
    --num_train_epochs 3 \
    --per_device_train_batch_size 4 \
    --per_device_eval_batch_size 4 \
    --gradient_accumulation_steps 16 \
    --evaluation_strategy "steps" \
    --eval_steps 20 \
    --save_strategy "steps" \
    --save_steps 150 \
    --save_total_limit 10 \
    --learning_rate 2e-5 \
    --weight_decay 0. \
    --warmup_ratio 0.03 \
    --lr_scheduler_type "cosine" \
    --logging_steps 1 \
    --fsdp "full_shard auto_wrap" \
    --fsdp_transformer_layer_cls_to_wrap 'LlamaDecoderLayer' \
    --tf32 True \
    --model_max_length 2048 \
    --gradient_checkpointing True \
    --lazy_preprocess True > training.vicuna.log 2> training.vicuna.err.log &