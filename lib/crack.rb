require './lib/enigma'
require './lib/key'

class Crack
  
  def self.crack(cipher, date)
    message = ''
    enigma = Enigma.new
    until message[-4, 4] == ' end'
      key = Key.new(nil).key
      message = enigma.decrypt(cipher, key, date)[:decryption]
    end
    self.new(message, key, date)
  end
  
  attr_reader :message,
              :date,
              :key
              
  def initialize(message, key, date)
    @message = message
    @date = date
    @key = key
  end
  
  # def crack
  #   message = ''
  #   key = 0
  #   enigma = Enigma.new
  #   loop do 
  #     key = random_number_string(Enigma::KEY_LENGTH)
  #     message = enigma.decrypt(@cipher, key, @date)[:decryption]
  #     break if message[-4, 4] == ' end'
  #   end
  # end
end