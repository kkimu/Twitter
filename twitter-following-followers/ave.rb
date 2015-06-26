cent =["deg","clo","bet","kcore","pr"]
cent.each do |i|
  ave = Array.new(10,0)
  for j in 0..9
    k=0
    open("result/#{j+1}/result_#{i}.txt").each do |line|
      ave[k] += line.to_f
      k += 1
    end
  end
  ave.each_index do |x|
    ave[x] /= 10.0
  end
  open("result/result/result_#{i}.txt","w") do |f|
    f.puts ave
  end
end
