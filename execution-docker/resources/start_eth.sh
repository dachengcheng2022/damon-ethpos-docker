#!/bin/bash
set -e

echo "geth starting "
cp /etc/jwtsecret   ${CONFIG_BASE_DIR}
cp /etc/config.toml /execution/geth/

geth  --datadir ${DATA_DIR} --http --http.api=net,web3,eth,debug,engine,admin \
                     --http.corsdomain=* --http.vhosts=* --http.addr=0.0.0.0   \
                     --syncmode=full --networkid=97823 --nodiscover \
                     --config=/etc/config.toml \
                     --authrpc.jwtsecret=${CONFIG_BASE_DIR}/jwtsecret --authrpc.addr=0.0.0.0 --authrpc.port=8551 --authrpc.vhosts=* \
                     --verbosity=5 --ipcpath=/data-ephemera --nodekey=${CONFIG_BASE_DIR}/enode.key --nat=extip:${EXTIP}

echo "geth starting endding "
