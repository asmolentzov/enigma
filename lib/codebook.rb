require './lib/rotator'

class Codebook
  
  def self.encrypt(message, shift)
    self.new(message, shift.shifts).code
  end
  
  def self.decrypt(cipher, shift)
    self.new(cipher, shift.backwards_shifts).code
  end
  
  def self.get_cipher_key(cipher, shifts, date)
    offsets = Offset.new(date).offsets
    keys = shifts.zip(offsets).map do |shift_offset| 
      shift_offset[0] - shift_offset[1]
    end
    x = keys.map do |key|
      if key < 0
        Enigma::CHARACTER_SET.length + key 
      else
        key
      end
    end
    # require 'pry'; binding.pry
  end
  
  def self.join_key(numbers)
    key = ''
    numbers.each do |number|
      number = number.to_s.rjust(2, '0')
      key += number[0]
    end
    key += numbers.last.to_s[1]
  end
  
  def initialize(phrase, shifts)
    @phrase = phrase
    @shifts = shifts
  end
  
  def four_split
    phrase_characters = @phrase.split('')
    split_phrase = []
    until phrase_characters == [] do
      split_phrase << phrase_characters.shift(Enigma::NUMBER_SHIFTS)
    end
    split_phrase
  end
  
  def code
    rotator = Rotator.new(Enigma::CHARACTER_SET)
    character_chunks = four_split
    character_chunks.map do |character_chunk|
      rotator.rotate_four(character_chunk, @shifts)
    end.join
  end
end