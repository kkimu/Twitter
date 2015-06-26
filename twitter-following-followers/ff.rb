def line_count(filename)
  begin
    open("extract/#{filename}.txt") do |f|
      nil while f.gets
      return f.lineno
    end
  rescue
    return 0
  end
end


i=0
nu = Hash.new(0)
score = Hash.new(0)
#userid.txtのユーザのフォロワー数とフォロワーのフォロワー数を調べる
open("../id_list.txt").each do |id|
  id.strip!
  begin
    open("extract/#{id}.txt").each do |line|
      nu[id] += line_count(line.strip)
    end
    lineno = line_count(id)
    if lineno > 0
      score[id] = nu[id].to_f / lineno.to_f
    else
      i+=1
      score[id] = 0
    end
  rescue
    i+=1
    score[id] = 0
  end
  #puts score[id]
end

puts "error : #{i}"
open("result_1.txt","w") do |f|
  score.sort{|a, b| b[1] <=> a[1]}.each do |k,v|
    if v > 0
      f.puts "#{k}\t#{v}"
    end
  end
end
