### 1 docker build 
###### 1.1 before build need modify /consensus-docker-base directory account_password and wallet_password's password. it the same as 2.2 keystore_password params
1.2 config genesis node at execution-docker/resources/config.toml
```shell
curl --location --request POST 'http://190.92.198.117:8545' \
--header 'Content-Type: application/json' \
--data-raw '{
    "jsonrpc": "2.0",
    "method": "admin_nodeInfo",
    "params": [],
    "id": 0
}'
```
1.3 config genesis node at docker-compose.yml PEER-INFO use below cmd
```shell
curl --location --request GET 'http://190.92.198.117:3500/eth/v1/node/identity' \
--header 'Accept: application/json'
```
```shell
docker-compose build
```

### 2 create validator keys
###### 2.1 replace your mnemonic
###### 2.2 replace your keystore_password
```shell
docker-compose run staking-cli \
--language=English \
--non_interactive \
existing-mnemonic \
--folder /basicconfig \
--mnemonic="drink grab giant fruit tell night fiction raven nominee swing side gauge soccer ecology caution virtual bomb knee wife flower produce can negative fiction" \
--keystore_password=12345678 \
--chain="mainnet" \
--validator_start_index=0 \
--num_validators=3 \
--devnet_chain_setting=/config_deposit.yml
```

### 2 validator init 
```shell
docker-compose run beaconbase validator_init.sh
```

### 3 geth init 
```shell
docker-compose run ethbase eth_init.sh
```

### 4 run geth
```shell
docker-compose up -d eth
```

### 5 run beacon and validator
```shell
docker-compose up -d beacon
```

### 7 run deposit balance
```shell
docker-compose run contract-cli ethctl beacon deposit  --allow-unknown-contract="true" \
--allow-excessive-deposit="true" \
--address="0x3e839677d23d9b7b0df00ed0c67750aa6412b75d" \
--connection=http://localhost:8545/  \
--data="/basicconfig/validator_keys/deposit_data.json"  \
--value="1024" --from="0x123463a4B065722E99115D6c222f267d9cABb524" \
--privatekey="2e0834786285daccd064ca17f1654f67b4aef298acbb82cef9ec422fb4975622"
```
