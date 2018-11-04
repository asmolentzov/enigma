require './lib/random_number_generator'

class Key
  
  include RandomNumber
  
  def self.get_keys(key)
    if key
      self.new(key).keys
    else
      self.new(random_number_string(Enigma::KEY_LENGTH)).keys
    end
  end
  
  def initialize(key)
    @key = key
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