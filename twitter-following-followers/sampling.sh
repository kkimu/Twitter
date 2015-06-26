#!/bin/bash
nohup ruby sampling_bfs.rb 1 30 >out.log 2>err.log &
nohup ruby sampling_dfs.rb 1 30 >out2.log 2>err2.log &
nohup ruby sampling_sec.rb 1 10 >out3.log 2>err3.log &
nohup ruby sampling_sec.rb 11 20 >out4.log 2>err4.log &
nohup ruby sampling_sec.rb 21 30 >out5.log 2>err5.log &
