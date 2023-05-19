#!/bin/sh
# GET_CONFIGS_READY FOR BASH FILE!
POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -exp_dir|--experiment_dir)
    EXPERIMENT_DIR="$2"
    shift # past argument
    shift # past value
    ;;
    -config|--config_fname)
    CONFIG_FNAME="$2"
    shift # past argument
    shift # past value
    ;;
    -seed|--seed_id)
    SEED_ID="$2"
    shift # past argument
    shift # past value
    ;;
    -wb_project|--wb_project)
    WB_PROJECT="$2"
    shift # past argument
    shift # past value
    ;;
    -wb_group|--wb_group)
    WB_GROUP="$2"
    shift # past argument
    shift # past value
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

neb-search --config_fname ${CONFIG_FNAME} --seed_id ${SEED_ID} --experiment_dir ${EXPERIMENT_DIR} -wb_project ${WB_PROJECT} -wb_group ${WB_GROUP}
# bash mle_search.sh --config_fname brax/train.yaml  --seed_id 0 --experiment_dir experiments -wb_project neuroevobench -wb_group testgroup
# neb-search --config_fname brax/train.yaml  --seed_id 0 --experiment_dir experiments -wb_project neuroevobench -wb_group testgroup