require './lib/rotator'

class Codebook
  
  def self.encrypt(message, shift)
    self.new(message, shift.shifts).code
  end
  
  def self.decrypt(cipher, shift)
    self.new(cipher, shift.backwards_shifts).code
  end
  
  def initialize(phrase, shifts)
    @phrase = phrase
    @shifts = shifts
  end
  
  def four_split
    phrase_characters = @phrase.split('')
    split_phrase = []
    until phrase_characters == [] do
      split_phrase << phrase_characters.shift(4)
    end
    split_phrase
  end
  
  def code
    rotator = Rotator.new(("a".."z").to_a << " ")
    character_chunks = four_split
    character_chunks.map do |character_chunk|
      rotator.rotate_four(character_chunk, @shifts)
    end.join
  end
end