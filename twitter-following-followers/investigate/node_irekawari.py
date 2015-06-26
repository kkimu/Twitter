#ランキングのノードの入れ替わりをみる
#
from collections import defaultdict

idlist = []
cent = ["deg","clo","bet","kcore","pr"]
#sampling = ["rand","bfs","dfs","sec"]
sampling = ["bfs","dfs","sec"]
per = [100,90,80,70,60,50,40,30,20,10]



rt_rank = defaultdict(int)
rt_num = defaultdict(int)
i=0
#rank[id]["t"]にidの正解の順位を入れる rt_num[id]にidのリツイート数をいれる
for line in open("../../twitter-rt/result/rt_result_1.txt"):
    sp = line.strip().split(" ")
    rt_rank[sp[0]] = i+1
    rt_num[sp[0]] = sp[1]
    i+=1

follow = defaultdict(set)
follower = defaultdict(set)
for line in open("../extracted/extracted_1.txt"):
    sp = line.strip().split(";")
    follow[sp[0]].add(sp[1])
    follower[sp[1]].add(sp[0])


for c in cent:
    for s in sampling:
        ###rankに順位を入れる
        rank = defaultdict(dict)
        #rank[id][percent]にidのpercentでの順位を入れる
        for p in per:
            j = 0
            for line in open("../work/result/1/{}_{}_{}per.txt".format(s,c,p)):
                #if(j < 5000):
                    sp = line.split(" ")
                    rank[sp[0]][p] = j+1
                    j+=1
                #else:
                #    break


        ###ファイルに書き込み
        f = open("node_irekawari_{}_{}.csv".format(s,c),"w")
        for p in per: # 1行目
            f.write(",{}%".format(p)) # ,100%,90%,...,10%
        f.write(",TRUTH,retweet,follow,follower,URL\n") # ,TRUTH\n

        #2行目から ID,100%のときのランク,90%,...,10%
        for k,v in rank.items():
            f.write("{}".format(k))
            #予測した順位
            for p in per:
                if(p in v):
                    f.write(",{}".format(v[p]))
                else:
                    f.write(",") #順位がないときは空
                    
            #正解順位、リツイート数
            if(k in rt_rank):
                f.write(",{},{}".format(rt_rank[k],rt_num[k]))
            else:
                f.write(",,") #正解順位がないときは空
                
            #フォロー数
            if(len(follow[k]) > 0):
                f.write(",{}".format(len(follow[k])))
            else:
                f.write(",0")
            if(k in follower):
                f.write(",{}".format(len(follower[k])))
            else:
                f.write(",0")
            
            f.write(",https://twitter.com/intent/user?user_id={}".format(k))
            f.write("\n")
            
