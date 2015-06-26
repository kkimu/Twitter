# coding: utf-8
#ネットワークデータからid_listにあるIDに関する関係だけを取り出す
#一周だけ

fnlist = []
open("filename4.txt").each do |fn|
  fnlist << fn.rstrip
end
idlist = Hash.new
open("../id_list.txt").each do |id|
  idlist[id.rstrip] = 1
end


a = []

fnlist.each do |fn|
  t0 = Time.now
  print fn+" "
  open("data/201410-followers/#{fn}").each do |line|
    sp = line.strip.split(";")
    if idlist[sp[0]] == 1 && idlist[sp[1]] == 1
      a << sp[1]+";"+sp[0]
    end
  end
#  open("data/201410-following/#{fn}").each do |line|
#    sp = line.strip.split(";")
#    if idlist[sp[0]] == 1 || idlist[sp[0]] == 1
#      a << line.strip
#    end
#  end
  puts "time:#{Time.now - t0}"
end

a.sort!
a.uniq!

open("extracted.txt","w") do |f|
  f.puts a
end
