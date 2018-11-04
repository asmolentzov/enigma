read_file = ARGV[0]
write_file = ARGV[1]

file = File.open(read_file, 'r')
message = file.read.chomp
require 'pry'; binding.pry