require './lib/enigma'
require 'date'

read_filepath = ARGV[0]
write_filepath = ARGV[1]

read_file = File.open(read_filepath, 'r')
message = read_file.read.chomp

enigma = Enigma.new
encryption = enigma.encrypt(message)

write_file = File.open(write_filepath, "w")
write_file.write(encryption[:encryption])
write_file.close

puts "Created #{write_filepath} with the key #{encryption[:key]} and date #{encryption[:date]}."