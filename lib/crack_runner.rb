require './lib/enigma'
require './lib/crack'
require 'date'

read_filepath = ARGV[0]
write_filepath = ARGV[1]
date = ARGV[2]

read_file = File.open(read_filepath, 'r')
cipher = read_file.read.chomp

enigma = Enigma.new
cracked = enigma.crack(cipher, date)

write_file = File.open(write_filepath, 'w')
write_file.write(cracked[:decryption])
write_file.close

puts "Created '#{write_filepath}' with the key #{cracked[:key]} and date #{cracked[:date]}"
