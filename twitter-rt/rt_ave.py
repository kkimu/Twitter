import time
from collections import defaultdict

t0 = time.time()
num = [100,500,1000,2000]
a = []
for n in num:
    sum = 0
    for i in range(1,21):
        j=0
        for line in open("result/rt_result_{}.txt".format(i)):
            if j<n:
                sum += int(line.split(" ")[1].strip())
                j+=1

    a.append("1-{}average_{} \t{}\n".format(i,n,sum/n/20))


f = open("retweet_average.txt","w")
for str in a:
    f.write(str)
f.close
print(" time:{}".format(time.time() - t0))
    
