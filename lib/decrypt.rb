require './lib/enigma'
require 'date'

read_filepath = ARGV[0]
write_filepath = ARGV[1]
key = ARGV[2]
date = ARGV[3]

read_file = File.new(read_filepath, 'r')
require 'pry'; binding.pry