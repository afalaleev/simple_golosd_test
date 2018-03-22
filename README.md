# simple_golosd_test
Simple load test for golosd

Test uses the `cli_wallet` for make load to `testnet-golosd`.
Copy files to a directory with assembled `cli_wallet`.
Run the command: `./run.sh 1 500`

It will create 500 `cli_wallet` processes which will send to golosd the following
sequence of commands:
1. create an account
2. transfer some vesting to the account
3. create post where author is the account
4. vote the post.

Each `cli_wallet` will send commands in parallel.

You may play with number of `cli_wallet`s and
sleep time before starting of the next `cli_wallet`:
`./run.sh 1 500 0.001`


Number of `cli_wallet`s and `sleep_time` depends on number of web threads in golosd.
For example, my `golosd` has `webserver-thread-pool-size = 32`, and I tested it with
500 `cli_wallets` and 0.001 sleep time.
