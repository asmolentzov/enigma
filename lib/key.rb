require './lib/random_number_generator'

class Key
  
  include RandomNumber
  
  def self.get_last_four(phrase)
    phrase[-4, 4]
  end
  
  def self.get_index_differences(characters)
    characters = characters.split('')
    rotator = Rotator.new(Enigma::CHARACTER_SET)
    characters.map.with_index do |character, index|
      rotator.get_amount(character, Enigma::CRACK_PHRASE[index])
    end
  end
  
  attr_reader :key
  
  def initialize(key)
    if key 
      @key = key
    else 
      @key = random_number_string(Enigma::KEY_LENGTH)
    end
  end
  
  def keys
    key_characters = @key.split('')
    split = []
    key_characters.each_with_index do |character, index|
      break unless index < Enigma::NUMBER_SHIFTS
      split << (character + key_characters[index + 1]).to_i
    end
    split
  end
  
end