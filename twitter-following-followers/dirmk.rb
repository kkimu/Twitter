for i in 1..100
  Dir.mkdir(i.to_s) unless Dir.exist?(i.to_s)
end
