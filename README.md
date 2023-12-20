git clone https://github.com/aechen1202/damn-vulnerable-defi-foundry_hw15.git

cd damn-vulnerable-defi-foundry_hw15

forge build

forge test --match-contract Unstoppable -vv 

forge test --match-contract NaiveReceiver -vv

