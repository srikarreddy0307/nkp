#/bin/bash
export WORKSPACE_NAMESPACE=kommander
export secret=customingress
export CERT_CA_PATH=/certs/rootca.crt
export CERT_PATH=/certs/srikar-mgmt.crt
export CERT_KEY_PATH=/certs/srikar-mgmt.key

echo "creating the secret"
kubectl create secret generic -n "${WORKSPACE_NAMESPACE}" ${secret} --from-file=ca.crt=$CERT_CA_PATH --from-file=tls.crt=$CERT_PATH --from-file=tls.key=$CERT_KEY_PATH --type=kubernetes.io/tls

echo "secret created"

