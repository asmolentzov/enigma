require './lib/random_number_generator'

class Key
  
  include RandomNumber
  
  attr_reader :key
  
  def initialize(key)
    if key 
      @key = key
    else 
      @key = random_number_string(Enigma::KEY_LENGTH)
    end
  end
  
  def keys
    key_characters = @key.chars
    split_key = []
    key_characters.each_with_index do |character, index|
      break unless index < Enigma::NUMBER_SHIFTS
      split_key << (character + key_characters[index + 1]).to_i
    end
    split_key
  end
  
end