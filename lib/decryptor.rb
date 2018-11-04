

class Decryptor
  
  def initialize(cipher, shifts)
    @cipher = cipher
    @shifts = shifts
  end
  

  
  def four_split
    cipher_characters = @cipher.split('')
    split_cipher = []
    until cipher_characters == [] do
      split_cipher << cipher_characters.shift(4)
    end
    split_cipher
  end
  
end