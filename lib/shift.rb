require './lib/key'
require './lib/offset'

class Shift
  
  def self.get_last_four(phrase)
    phrase[-4, 4].split('')
  end
  
  def self.get_index_differences(characters)
    rotator = Rotator.new(Enigma::CHARACTER_SET)
    characters.map.with_index do |character, index|
      rotator.get_amount(character, Enigma::CRACK_PHRASE[index])
    end
  end
  
  def self.get_cipher_shifts(cipher)
    last_four = self.get_last_four(cipher)
    self.get_index_differences(last_four)
  end
  
  def initialize(key, date)
    @key = Key.new(key)
    @offset = Offset.new(date)
  end
  
  def key
    @key.key
  end
  
  def date
    @offset.date
  end
  
  def shifts
    keys = @key.keys
    offsets = @offset.offsets

    keys.zip(offsets).map do |key_offset|
      key_offset.sum
    end
  end
  
  def backwards_shifts
    shifts.map do |shift|
      -shift
    end
  end
end