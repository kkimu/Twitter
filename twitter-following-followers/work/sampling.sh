#!/bin/bash

nohup R --vanilla --slave --args 21 25 < c_sampling_rand.R >out.log 2>err.log &
nohup R --vanilla --slave --args 26 30 < c_sampling_rand.R >out2.log 2>err2.log &

nohup R --vanilla --slave --args 21 25 < c_sampling_bfs.R >out3.log 2>err3.log &
nohup R --vanilla --slave --args 26 30 < c_sampling_bfs.R >out4.log 2>err4.log &

nohup R --vanilla --slave --args 21 25 < c_sampling_dfs.R >out5.log 2>err5.log &
nohup R --vanilla --slave --args 26 30 < c_sampling_dfs.R >out6.log 2>err6.log &

nohup R --vanilla --slave --args 21 25 < c_sampling_sec.R >out7.log 2>err7.log &
nohup R --vanilla --slave --args 26 30 < c_sampling_sec.R >out8.log 2>err8.log &
