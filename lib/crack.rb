class Crack
  
  def self.crack(cipher, date)
    
  end
  
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
end