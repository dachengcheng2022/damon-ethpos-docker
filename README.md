### 1 docker build 
###### 1.1 before build need modify /consensus-docker-base directory account_password and wallet_password's password. it the same as 2.2 keystore_password params
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

### 3 beacon init
```shell
docker-compose run beaconbase beacon_init.sh
```

it will create genesis.json, geneisi.szz in the ./basciconfig

### 4 validator init 
```shell
docker-compose run beaconbase validator_init.sh
```

### 5 geth init 
```shell
docker-compose run ethbase eth_init.sh
```

### 6 run geth 
```shell
docker-compose up -d eth
```

### 7 run beacon and validator 
```shell
docker-compose up -d beacon
```


### modify deposit contrcat address

