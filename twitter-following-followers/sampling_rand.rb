# coding: utf-8
#ランダムサンプリング
#

t0 = Time.now

for n in ARGV[0].to_i..ARGV[1].to_i
  
  data=[]
  open("extracted/extracted_#{n}.txt").each do |line|
      data << line
  end
  
  id=[]
  open("../id_list_#{n}.txt").each do |line|
    id << line.strip
  end
  
  id.uniq!
  
  len = id.length

  percent = [100,90,80,70,60,50,40,30,20,10,5,2,1,0.5,0.2,0.1]
  
  percent.each do |i|
    t1 = Time.now
    num = (len*i*0.01).to_i #num = 50000 * percent *0.01
    #puts num
    id.shuffle!

    target_id = Hash.new
    
    for j in 0..num-1
      target_id[id[j]] = 1
    end
    print target_id.length,"\t"

    list = []
    target_id.each {|k,v| list << k}
    open("sampling/#{n}/rand_#{i}per_node.txt","w") {|f| f.puts list}
    
    data1 = []
    data.each do |line|
      sp = line.strip.split(";")
      if target_id[sp[0]] == 1 && target_id[sp[1]] == 1
        data1 << line
      end
    end
    
    open("sampling/#{n}/rand_#{i}per.txt","w") do |f|
      f.puts data1
    end
    puts "\tTime#{i.to_s.rjust(3)}per:#{Time.now-t1}"
  end
  
  puts "#{n} Time:#{Time.now-t0}"
end
