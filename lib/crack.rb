require './lib/random_number_generator'
require './lib/enigma'

class Crack
  
  include RandomNumber
  
  attr_reader :cipher,
              :date,
              :key, 
              :decryption
              
  def initialize(cipher, date)
    @cipher = cipher
    @date = date
    @key = ''
    @decryption = ''
  end
  
  def crack
    message = ''
    key = 0
    enigma = Enigma.new
    loop do 
      key = random_number_string(Enigma::KEY_LENGTH)
      message = enigma.decrypt(@cipher, key, @date)[:decryption]
      break if message[-4, 4] == ' end'
    end
  end
end