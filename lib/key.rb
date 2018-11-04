require './lib/random_number_generator'

class Key
  
  include RandomNumber
  
  def self.get_keys(key)
    self.new(key).keys
  end
  
  def initialize(key)
    if key 
      @key = key
    else 
      @key = random_number_string(Enigma::KEY_LENGTH)
    end
  end
  
  def key_split
    key_characters = @key.split('')
    split = []
    key_characters.each_with_index do |character, index|
      break unless index < Enigma::NUMBER_SHIFTS
      split << (character + key_characters[index + 1]).to_i
    end
    split
  end
  
end