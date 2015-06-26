#n回繰り返し
n=100


#idlistにユーザのidいれる
idlist = []
open("twitter-following-followers/user_id_1.txt").each do |line|
  idlist << line.strip
end
open("twitter-following-followers/user_id_2.txt").each do |line|
  idlist << line.strip
end


idlist.uniq!

for i in 10..n
  idlist.shuffle!
  
  open("id_list_#{i+1}.txt","w") do |f|
    for j in 0..49999
      #puts idlist[j]
      f.puts idlist[j]
    end
  end
end
