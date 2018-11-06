require './lib/enigma'
require './lib/key'

class Crack
  
  def self.crack(cipher, date)
    message = ''
    enigma = Enigma.new
    until message[-4, 4] == Enigma::CRACK_PHRASE
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
end