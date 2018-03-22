#!/bin/bash
id=$1
endpoint=$2

cp wallet.json wallet$1.json
./cli_wallet --server-rpc-endpoint=$endpoint --commands="`./action.sh $1`" --wallet-file=wallet$1.json
rm wallet$1.json
