#/bin/bash
export CLUSTER_NAME=srikar-mgmt
export NAMESPACE=default
export AWS_ID=jKU_CcZe-BO86msNGowCK7Hu_Tw7Lu0m
export AWS_SECRET_ACCESS_KEY=mdgUZLN6thpzcPxzyvCumnv_DciebjnV
kubectl create secret generic ${CLUSTER_NAME}-loki-obj-creds -n ${NAMESPACE} --from-literal=AWS_ACCESS_KEY_ID=${AWS_ID} --from-literal=AWS_SECRET_ACCESS_KEY=${AWS_SECRET}
