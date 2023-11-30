#!/bin/bash
set -e

echo "geth starting "
cp /etc/jwtsecret   ${CONFIG_BASE_DIR}

if [ ! -f "/etc/config.toml" ];then
    cp /etc/config.tmp /etc/config.tmp.1
    NODE_URL=$(curl -X POST 'http://190.92.198.117:8545' --header 'Content-Type: application/json' --data-raw '{"jsonrpc": "2.0","method": "admin_nodeInfo","params": [],"id": 0}' | jq -r .result.enode) \
    && sed -i 's!NODE_URL!'"${NODE_URL}"'!g' /etc/config.tmp.1;
    echo "*******************************NODE_URL********************=" ${NODE_URL};
    mv /etc/config.tmp.1 /etc/config.toml;
fi


geth  --datadir ${DATA_DIR} --http --http.api=net,web3,eth,debug,engine,admin \
                     --http.corsdomain=* --http.vhosts=* --http.addr=0.0.0.0   \
                     --syncmode=full --networkid=97823 --nodiscover \
                     --config=/etc/config.toml \
                     --authrpc.jwtsecret=${CONFIG_BASE_DIR}/jwtsecret --authrpc.addr=0.0.0.0 --authrpc.port=8551 --authrpc.vhosts=* \
                     --verbosity=5 --ipcpath=/data-ephemera --nodekey=${CONFIG_BASE_DIR}/enode.key --nat=extip:${EXTIP}

echo "geth starting endding "
