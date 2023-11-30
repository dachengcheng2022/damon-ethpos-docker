#!/bin/bash
set -e

echo "beacon starting " ;
wget -P ${CONFIG_BASE_DIR}/ https://raw.githubusercontent.com/dachengcheng2022/genesis-ethpos-docker/master/public/genesis.ssz ;
PEER_INFO=$(curl -X GET 'http://190.92.198.117:3500/eth/v1/node/identity' --header 'Content-Type: application/json'| jq -r .data.p2p_addresses[2]) ;

echo "PEER_INFO=" ${PEER_INFO} ;
beacon-chain \
  --datadir=${DATA_DIR} \
  --min-sync-peers=0 \
  --genesis-state=${CONFIG_BASE_DIR}/genesis.ssz \
  --bootstrap-node=${PEER_INFO} \
  --chain-config-file=/config.yml \
  --config-file=/config.yml \
  --chain-id=97823 \
  --rpc-host=0.0.0.0 \
  --contract-deployment-block=0 \
  --grpc-gateway-host=0.0.0.0 \
  --monitoring-host=0.0.0.0 \
  --execution-endpoint=http://eth:8551 \
  --accept-terms-of-use \
  --jwt-secret=${CONFIG_BASE_DIR}/jwtsecret \
  --contract-deployment-block=0 \
  --verbosity=debug \
  --p2p-local-ip=0.0.0.0 \
  --p2p-host-ip=${HOST_IP} \
  --p2p-static-id  \
  --peer=${PEER_INFO}

echo "beacon starting endding "


