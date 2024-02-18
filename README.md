### 1 docker build 
###### 1.1 before build need modify /consensus-docker-base directory account_password and wallet_password's password. it the same as 2.2 keystore_password params
###### 1.2 ##change docker-compose.yml  eth and beacon expose IP###

```shell
docker-compose build --no-cache
```

### 2 create validator keys
###### 2.1 replace your mnemonic
###### 2.2 replace your keystore_password. you can build a random mnemonic
```shell 
 docker-compose run staking-cli --language=English --non_interactive new-mnemonic --keystore_password=12345678 --chain="mainnet" --num_validators=3 --execution_address=0x161783e9f3d16d0d5a8e5027805c7a54dfe61e03
```
```shell
docker-compose run staking-cli \
--language=English \
--non_interactive \
existing-mnemonic \
--folder /basicconfig \
--mnemonic="floor cruel thank hill unfold spray wagon fold aspect confirm match concert upon clown slice twenty water super nominee book entire border detect meat“ \
--keystore_password=12345678 \
--chain="mainnet" \
--validator_start_index=0 \
--num_validators=3 \
--execution_address=0x161783e9f3d16d0d5a8e5027805c7a54dfe61e03 \
--devnet_chain_setting=/config_deposit.yml
```
or powershell 
```shell
docker-compose run staking-cli --language=English --non_interactive existing-mnemonic --folder /basicconfig --mnemonic="crash dog curtain surface river current wood describe secret fan wear castle sea noble welcome seat antenna wear tray point media ocean destroy mom" --keystore_password=12345678 --chain="mainnet" --validator_start_index=0 --num_validators=3 --execution_address=0xCBf79Ae1b1b58Eb6b84Ad159588d35A71dE49b6c --devnet_chain_setting=/config_deposit.yml
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
docker-compose run contract-cli ethereal beacon deposit  --allow-unknown-contract="true" \
--allow-excessive-deposit="true" \
--address="0x3e839677d23d9b7b0df00ed0c67750aa6412b75d" \
--connection=http://3.0.19.180:8545/  \
--data="/basicconfig/validator_keys/deposit_data.json"  \
--value="1024" --from="0x161783e9f3d16d0d5a8e5027805c7a54dfe61e03" \
--privatekey="2e0834786285daccd064ca17f1654f67b4aef298acbb82cef9ec422fb4975622"
```
or powershell
```shell
docker-compose run contract-cli ethereal beacon deposit  --allow-unknown-contract="true" --allow-excessive-deposit="true" --address="0x3e839677d23d9b7b0df00ed0c67750aa6412b75d" --connection=http://190.92.198.117:8545/ --data="/basicconfig/validator_keys/deposit_data.json" --value="1024" --from="0x123463a4B065722E99115D6c222f267d9cABb524" --privatekey="2e0834786285daccd064ca17f1654f67b4aef298acbb82cef9ec422fb4975622"
```