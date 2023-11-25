#!/bin/bash
set -e
echo "geth init startting"

geth --datadir ${DATA_DIR} init ${CONFIG_BASE_DIR}/genesis.json
bootnode --genkey=${CONFIG_BASE_DIR}/enode.key --writeaddress

echo "geth init end..."
