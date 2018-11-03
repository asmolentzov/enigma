require './lib/rotator'

class Encryptor
  
  def initialize(message, shifts)
    @message = message
    @shifts = shifts
  end
  
  def encrypt
    rotator = Rotator.new(("a".."z").to_a << " ")
    character_chunks = four_split
    character_chunks.map do |character_chunk|
      rotator.rotate_four(character_chunk, @shifts)
    end.join
  end
  
  def four_split
    message_characters = @message.split('')
    split_message = []
    until message_characters == [] do
      split_message << message_characters.shift(4)
    end
    split_message
  end
end