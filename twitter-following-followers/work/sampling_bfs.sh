#!/bin/bash

nohup R --vanilla --slave --args 2 2 < c_sampling_bfs.R >out.log 2>err.log &
nohup R --vanilla --slave --args 3 3 < c_sampling_bfs.R >out.log 2>err.log &
nohup R --vanilla --slave --args 4 4 < c_sampling_bfs.R >out.log 2>err.log &
nohup R --vanilla --slave --args 5 5 < c_sampling_bfs.R >out.log 2>err.log &
nohup R --vanilla --slave --args 6 6 < c_sampling_bfs.R >out.log 2>err.log &
nohup R --vanilla --slave --args 7 7 < c_sampling_bfs.R >out.log 2>err.log &
nohup R --vanilla --slave --args 8 8 < c_sampling_bfs.R >out.log 2>err.log &
nohup R --vanilla --slave --args 9 9 < c_sampling_bfs.R >out.log 2>err.log &
nohup R --vanilla --slave --args 10 10 < c_sampling_bfs.R >out.log 2>err.log &
