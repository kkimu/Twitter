#!/bin/bash

nohup R --vanilla --slave --args 1 5 < c_sampling_rand.R >out.log 2>err.log &
nohup R --vanilla --slave --args 6 10 < c_sampling_rand.R >out2.log 2>err2.log &
nohup R --vanilla --slave --args 11 15 < c_sampling_rand.R >out3.log 2>err3.log &
nohup R --vanilla --slave --args 16 20 < c_sampling_rand.R >out4.log 2>err4.log &
nohup R --vanilla --slave --args 21 25 < c_sampling_rand.R >out5.log 2>err5.log &
nohup R --vanilla --slave --args 26 30 < c_sampling_rand.R >out6.log 2>err6.log &
