require './lib/rotator'
require './lib/key'

class Codebook
  
  def self.encrypt(message, shift)
    self.new(message, shift.shifts).code
  end
  
  def self.decrypt(cipher, shift)
    self.new(cipher, shift.backwards_shifts).code
  end
  
  def self.get_cipher_key(cipher, shifts, date)
    offsets = Offset.new(date).offsets
    keys = Key.new(nil).keys
    # require 'pry'; binding.pry
    # possible_keys = (0..99).to_a.repeated_permutation(5).to_a
    # require 'pry'; binding.pry
    # keys = possible_keys.find do |keys|
    #   self.valid_key?(keys, offsets, shifts)
    # end
    # until self.valid_key?(keys, offsets, shifts)
    #   keys = Key.new(nil).keys
    # end
    
    self.join_key(keys)
  end
  
  def self.join_key(numbers)
    key = ''
    numbers.each do |number|
      number = number.to_s.rjust(2, '0')
      key += number[0]
    end
    key += numbers.last.to_s.rjust(2, '0')[1]
  end
  
  def self.valid_key?(keys, offsets, shifts)
    key_strings = keys.map do |number|
      number.to_s.rjust(2, '0')
    end    
    valid = []
    key_strings.each_with_index do |number, index|
      break unless index < (key_strings.length - 1)
      valid << (number[1] == key_strings[index + 1][0])
    end
    
    valid_two = []
    # keys.each_with_index do |key, index|
    #   valid_two << (((key + offsets[index]) % 27) == (shifts[index] % 27))
    # end
    
    keys.each_with_index do |key, index|
      valid_two << (((key + offsets[index]) % Enigma::CHARACTER_SET.length) == shifts[index])
    end
    valid.all? && valid_two.all?
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