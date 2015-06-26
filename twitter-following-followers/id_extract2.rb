# coding: utf-8
#ネットワークデータからid_listにあるIDに関する関係だけを取り出す
#繰り返し

t0 = Time.now

fnlist = []
open("filename5.txt").each do |fn|
  fnlist << fn.rstrip
end

#N回繰り返し
N=100

N.times do |i|
  t1 = Time.now
  idlist = Hash.new
  open("../id_list_#{i+1}.txt").each do |id|
    idlist[id.rstrip] = 1
  end
  
  a = []
  fnlist.each do |fn|
    t2 = Time.now
    
    print fn+" "
    open("data/201312-followers/#{fn}").each do |line|
      sp = line.strip.split(";")
      if idlist[sp[0]] == 1 && idlist[sp[1]] == 1
        a << sp[1]+";"+sp[0]
      end
    end
    puts "time:#{Time.now - t2}"
  end
  
  a.sort!
  a.uniq!
  
  open("extracted/extracted_#{i+1}.txt","w") do |f|
    f.puts a
  end
  puts "time n=#{i+1}:#{Time.now - t1}"
end

puts "total time:#{Time.now - t0}"
