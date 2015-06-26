require 'optparse'
a = ""
opt = OptionParser.new
opt.on('-a') {|v| a = v}

opt.parse!(ARGV)
puts a
