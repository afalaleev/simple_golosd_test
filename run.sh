#!/bin/bash

start=${1:-1}
step=${2:-500}
sleep=${3:-0.001}
endpoint=${4:-"ws://127.0.0.1:8091"}

stop=$(($start + $step))

# create default wallet.json
rm wallet.json
./cli_wallet --server-rpc-endpoint=$endpoint --commands="set_password 1qaz && unlock 1qaz && import_key 5JVFFWRLwz6JoP9kguuRFfytToGU6cLgBVTL9t6NB3D3BQLbUBS"

for i in $(seq $start $stop); do
	# each call call some sequences of commands via cli_wallet
	./call.sh $i $endpoint &
	# sleep allows to push different sequence of commands to golosd
	sleep $sleep
done
