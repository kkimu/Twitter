import time
from collections import defaultdict

t0 = time.time() 

fnlist = []
for line in open("../filename.txt","r"):
    fnlist.append("data/2013-12/{}".format(line.strip()))
for line in open("../filename2.txt","r"):
    fnlist.append("data/2014-01/{}".format(line.strip()))

for i in range(1,2):
    t1 = time.time()
    idset = set()
    for line in open("../../id_list_{}.txt".format(i)):
        idset.add(line.strip())
        
    rt = defaultdict(list)
    for fn in fnlist:
        t2 = time.time()
        print(fn,end="")
        for line in open("../{}".format(fn)):
            sp = line.split("\t")
            if(sp[1] in idset and sp[5] in idset):
                rt[sp[5]].append(sp[1])
        print(" time:{}".format(time.time() - t2))

    f = open("result/rt_result_{}.txt".format(i),"w")
    for k,v in rt.items():
        rt[k] = len(set(v))
    for k,v in sorted(rt.items(),key=lambda x:x[1],reverse=True):
        f.write("{} {}\n".format(k,v))
    f.close
    print(" time_{}:{}".format(i,time.time() - t1))
    
print(" total time:{}".format(time.time() - t0))
   
