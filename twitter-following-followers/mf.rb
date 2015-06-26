cent =["deg","clo","bet","kcore","pr"]
N = 20
mf = [100,500,1000,2000]
mf.each do |n|
  for i in 1..N
    rt = Hash.new
    open("../twitter-rt/result/rt_result_#{i}.txt").each do |line|
      a = line.split(" ")
      rt[a[0].to_i] = a[1].to_i
    end
    
    cent.each do |j|
      per = [100,90,80,70,60,50,40,30,20,10]
      result = []
      per.each do |k|
        count = 0
        sum = 0
        open("work/result/#{i}/#{j}_#{k}per.txt").each do |line|
          if count < n
            a = line.split(" ")
            sum += rt[a[0].to_i].to_i
          else
            break
          end

          count += 1
        end
        result << sum/n.to_f
      end
      open("result/#{i}/mf#{n}_#{j}.txt","w") do |f|
        f.puts result
      end
    end
  end
    
  cent.each do |i|
    ave = Array.new(10,0)
    for j in 1..N
      k=0
      open("result/#{j}/mf#{n}_#{i}.txt").each do |line|
        ave[k] += line.to_f
        k += 1
      end
    end
    ave.each_index do |x|
      ave[x] /= N
    end
    open("result/result/mf#{n}_#{i}.txt","w") do |f|
      f.puts ave
    end
  end
end
