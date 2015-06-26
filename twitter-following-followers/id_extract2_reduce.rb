fnlist = []
open("filename3.txt").each do |fn|
  fnlist << fn.rstrip
end

idlist = Hash.new
open("../id_list.txt").each do |id|
  idlist[id.rstrip] = 1
end

open("extracted_followers.txt").each do |line|
  idlist[line.split(";")[1].strip] = 1
end


file_exist = Hash.new

for j in 0..4
  fnlist.each do |fn|
    puts fn
    t0 = Time.now

    file_content = []
    open("data/201409-followers/#{fn}").each do |line|
      file_content << line.strip
    end
    file_content.shuffle!

    for n in 1..10
      t1 = Time.now
      h = Hash.new{|hash,key| hash[key] = Array.new}
      i=1

      file_content.each do |line|
        if i%10 < n
          a = line.split(";")
          if idlist[a[0].strip] == 1
            h[a[0].strip] << a[1].strip
          end
        end
        i+=1
      end
            
      h.each do |k,v|
        open("reduce/#{j+1}/#{n*10}per/#{k.strip}.txt","a") do |f|
          v.uniq!
          f.puts v
        end
      end

      puts "time:#{Time.now - t1}"
    end
    puts "time:#{fn} #{Time.now - t0}"
  end
end
