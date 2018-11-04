require './lib/enigma'
require 'date'

read_filepath = ARGV[0]
write_filepath = ARGV[1]
key = ARGV[2]
date = ARGV[3]

read_file = File.open(read_filepath, 'r')
cipher = read_file.read

enigma = Enigma.new
decryption = enigma.decrypt(cipher, key, date)

write_file = File.open(write_filepath, 'w')
write_file.write(decryption[:decryption])
write_file.close

puts "Created '#{write_filepath}' with the key #{decryption[:key]} and date #{decryption[:date]}"

