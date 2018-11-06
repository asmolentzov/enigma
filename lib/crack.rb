class Crack
  
  
  
  attr_reader :cipher,
              :date,
              :key
              
  def initialize(cipher, date)
    @cipher = cipher
    @date = date
    @key = ''
  end
end