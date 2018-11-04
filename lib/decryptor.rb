require './lib/rotator'

class Decryptor
  
  def initialize(cipher, shifts)
    @cipher = cipher
    @shifts = get_negative_shifts(shifts)
  end
  
  def decrypt
    rotator = Rotator.new(("a".."z").to_a << " ")
    character_chunks = four_split
    character_chunks.map do |character_chunk|
      rotator.rotate_four(character_chunk, @shifts)
    end.join
  end
  
  def four_split
    cipher_characters = @cipher.split('')
    split_cipher = []
    until cipher_characters == [] do
      split_cipher << cipher_characters.shift(4)
    end
    split_cipher
  end
  
  def get_negative_shifts(shifts)
    shifts.map do |shift|
      -shift
    end
  end
  
end