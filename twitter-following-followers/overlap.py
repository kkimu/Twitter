#サンプリングしたユーザの正解との比較 
#上位＊ユーザをcoverしているか

from collections import defaultdict
N = 30
cent = ["deg","clo","bet","pr","kcore"]
sampling = ["rand","bfs","dfs","sec"]
#sampling = ["bfs","dfs","sec"]
per = [100,90,80,70,60,50,40,30,20,10]
overlap = [100,500,1000,2000]
result = defaultdict(lambda : defaultdict(lambda : defaultdict(lambda : defaultdict(list))))

for n in range(1,N+1):
    #リツイート数による正解のランキングをrt_rankに入れる
    rt_rank = []
    rt_num = defaultdict(int)
    for line in open("../twitter-rt/result/rt_result_{}.txt".format(n)):
        sp = line.strip().split(" ")
        rt_rank.append(sp[0])
        rt_num[sp[0]] = sp[1]
    
    for s in sampling:
        for c in cent:
            ###rankに順位を入れる
            for p in per:
                rank = []
                for line in open("work/result/{}/{}_{}_{}per.txt".format(n,s,c,p)):
                    rank.append(line.strip().split(" ")[0])
                #Overlap p
                for o in overlap:
                    result[n][s][c][o].append(len(set(rank[:o]) & set(rt_rank[:o]))/o)
    print(n)
                    

#平均を計算
ave = defaultdict(lambda: defaultdict(lambda: defaultdict(dict)))
for s in sampling:
    for c in cent:
        for p in per:
            for o in overlap:
                sum = 0
                for n in range(1,N+1):
                    sum += result[n][s][c][o][per.index(p)]
                ave[s][c][o][per.index(p)] = sum/N


#出力
f = open("result.csv","w")
for o in overlap:
    for s in sampling:
        f.write("\n{}\nOverlap{},Degree,Closeness,Betweenness,PageRank,k-core\n".format(s,o))
        for p in per:
            f.write("{}%".format(p))
            for c in cent:
                f.write(",{}".format(ave[s][c][o][per.index(p)]))
            f.write("\n")
    f.write("\n")
