require './lib/enigma'
require 'date'

read_file = ARGV[0]
write_file = ARGV[1]

file = File.open(read_file, 'r')
message = file.read.chomp

enigma = Enigma.new
encryption = enigma.encrypt(message)

puts "Created 'encrypted.txt' with the key #{encryption[:key]} and date #{encryption[:date]}. Encryption is #{encryption[:encryption]}."