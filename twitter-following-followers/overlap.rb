t0 = Time.now
cent =["deg","clo","bet","kcore","pr"]

overlap = [100,500,1000,2000]

N = 20
overlap.each do |lap|
  t1 = Time.now
  for i in 1..N
    rank1 = []
    open("../twitter-rt/result/rt_result_#{i}.txt").each do |line|
      a = line.split(" ")
      rank1 << a[0].to_i
    end
    
    cent.each do |j|
      per = [100,90,80,70,60,50,40,30,20,10]
      result = []
      per.each do |k|
        rank2 = []
        open("work/result/#{i}/#{j}_#{k}per.txt").each do |line|
          a = line.split(" ")
          rank2 << a[0].to_i
        end
        
        c = (rank1[0..lap-1] - rank2[0..lap-1]).length
        result << 1-c/lap.to_f
      end
      open("result/#{i}/Overlap#{lap}_#{j}.txt","w") do |f|
        f.puts result
      end
    end
  end
  
  cent.each do |i|
    ave = Array.new(10,0)
    for j in 1..N
      k=0
      open("result/#{j}/Overlap#{lap}_#{i}.txt").each do |line|
        ave[k] += line.to_f
        k += 1
      end
    end
    ave.each_index do |x|
      ave[x] /= N.to_f
    end
    open("result/result/Overlap#{lap}_#{i}.txt","w") do |f|
      f.puts ave
    end
  end
  puts "lap#{lap}\tTime:#{Time.now - t1}"
end

puts "Time:#{Time.now - t0}"
