fnlist = []
open("filename.txt").each do |fn|
  fnlist << fn.rstrip
end
idlist = Hash.new
open("../id_list.txt").each do |id|
  idlist[id.rstrip] = 1
end


rt = Hash.new{|hash,key| hash[key] = Array.new}

fnlist.each do |fn|
  t0 = Time.now
  print fn+" "
  open("data/2014-09/#{fn}").each do |line|
    sp = line.strip.split("\t")
    if idlist[sp[1]] == 1 && idlist[sp[5]] == 1
      rt[sp[5]] << sp[1]
    end
  end
  puts "time:#{Time.now - t0}"
end


open("rt_result.txt","w") do |f|
  rt.each do |k,v|
    
    f.puts "#{k} #{v.uniq.length}"
  end
end
