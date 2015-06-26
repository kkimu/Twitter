cent =["deg","clo","bet","pr","kcore"]

lap = [100,500,1000,2000]
lap.each do |n|
  w = ["Overlap","mf"]
  w.each do |s|
    matome = Array.new(10){Array.new(cent.length,0)}
    cent.each_index do |i|
      j = 0
      open("result/result/#{s}#{n}_#{cent[i]}.txt").each do |line|
      matome[j][i] = line.to_f
      j += 1
    end
  end
    open("result/result/#{s}#{n}.txt","w") {|f|}
    matome.each do |mato|
      open("result/result/#{s}#{n}.txt","a") do |f|
      mato.each do |num|
        f.print num,"\t"
      end
      f.print "\n"
    end
  end
  
    sample = ["bfs","dfs","sec"]
    sample.each do |method|
      matome = Array.new(10){Array.new(cent.length,0)}
      cent.each_index do |i|
        j = 0
        open("result/result/#{method}_#{s}#{n}_#{cent[i]}.txt").each do |line|
          matome[j][i] = line.to_f
          j += 1
        end
      end
      open("result/result/#{method}_#{s}#{n}.txt","w") {|f|}
      matome.each do |mato|
        open("result/result/#{method}_#{s}#{n}.txt","a") do |f|
          mato.each do |num|
            f.print num,"\t"
          end
          f.print "\n"
        end
      end
    end
  end
end
