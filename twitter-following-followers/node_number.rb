method = "sec"

n = 10
for i in 1..n
  puts i
  per = [10,20,30,40,50,60,70,80,90,100]
  per.each do |j|
    id = []
    open("sampling/#{i}/#{method}_#{j}per.txt").each do |line|
      a = line.strip.split(";")
      id << a[0]
      id << a[1]
    end
    id.uniq!
    puts "#{method}_#{j}per.txt\t#{id.length}"
  end
end
