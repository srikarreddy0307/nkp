#!/bin/bash

# PC USERNAME AND PASSWORD

export PC_ENDPOINT=https://190.170.10.209:9440
export NUTANIX_USER=admin
export NUTANIX_PASSWORD='KubePods@321'

# PE CLUSTER NAME AND PROJECT

export PE_CLUSTER_01=NTNX-DC

export PROJECT=srikar

# IMAGE REGISTRY

export REGISTRY_PASSWORD='12345'
export REGISTRY_USERNAME=admin
export REGISTRY_URL="https://srikarharbor.kuberox.net/nkp-v-2.17"
export CA_CERT="/certs/rootca.crt"

# STROAGE CONTATNER NAME

export STROAGE_CONTATNER=srikar

# MANAGEMENT CLUSTER NAME, IP AND SUBNET

export CLUSTER_NAME=srikar-mgmt
export CP_ENDPOINT_IP=190.170.21.241
export SUBNET='IPAM_VLAN_20'
export SSH_KEY_FILE="/root/.ssh/id_rsa.pub"
export SSH_USER=nkp

# LB RANGE, POD AND SVC NETWORK

export LB_RANGE="190.170.21.242-190.170.21.245"
#exort POD_NET="<pod network >
#export SVC_NET="svc n/w"

# IMAGE FOR MASTER AND WORKER NODE AND CPV, MEMORY, DISK REPLICAS

export NKP_IMAGE=nkp-rhel-9.6-1.34.1-20260128025639
export WORKER_DISK_SIZE=150
export WORKER_MEM=32
export WORKER_VCPU=8
export WORKER_CP_VCPU=1
export WORKER_REPLICAS=4
export CTR_DISK_SIZE=150
export CTR_MEM=16
export CTR_VCPU=4
export CTR_CP_VCPU=1
export CTR_REPLICAS=3

export OUTPUT=yaml

#categories
export CP_CAT="srikar=managementcp"
export WRK_CAT="srikar=managementwrk"

mkdir /nkp/clusters/management-cluster/manifests/files 

nkp create cluster nutanix \
--endpoint ${PC_ENDPOINT} \
--cluster-name ${CLUSTER_NAME} \
--control-plane-endpoint-ip ${CP_ENDPOINT_IP} \
--control-plane-prism-element-cluster ${PE_CLUSTER_01} \
--control-plane-subnets ${SUBNET} \
--control-plane-vm-image ${NKP_IMAGE} \
--control-plane-memory ${CTR_MEM} \
--control-plane-disk-size ${CTR_DISK_SIZE} \
--control-plane-vcpus ${CTR_VCPU} \
--control-plane-cores-per-vcpu ${CTR_CP_VCPU} \
--control-plane-pc-project ${PROJECT} \
--control-plane-pc-categories ${CP_CAT} \
--worker-prism-element-cluster ${PE_CLUSTER_01} \
--worker-subnets ${SUBNET} \
--worker-vm-image ${NKP_IMAGE} \
--worker-disk-size ${WORKER_DISK_SIZE} \
--worker-memory ${WORKER_MEM} \
--worker-cores-per-vcpu ${WORKER_CP_VCPU} \
--worker-replicas ${WORKER_REPLICAS} \
--worker-vcpus ${WORKER_VCPU} \
--worker-pc-project ${PROJECT} \
--worker-pc-categories ${WRK_CAT} \
--csi-storage-container ${STROAGE_CONTATNER} \
--kubernetes-service-load-balancer-ip-range ${LB_RANGE} \
--csi-hypervisor-attached-volumes=true \
--ssh-public-key-file ${SSH_KEY_FILE} \
--ssh-username ${SSH_USER} \
--registry-mirror-cacert ${CA_CERT} \
--registry-mirror-password ${REGISTRY_PASSWORD} \
--registry-mirror-url ${REGISTRY_URL} \
--registry-mirror-username ${REGISTRY_USERNAME} \
--verbose 4 \
--insecure=true \
--dry-run=true \
--output=yaml \
--output-directory=/nkp/clusters/management-cluster/manifests/files
