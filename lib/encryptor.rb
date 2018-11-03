class Encryptor
  
  def initialize(message, shifts)
    @message = message
    @shifts = shifts
  end
  
  def encrypt
    rotator = Rotator.new(("a".."z").to_a << " ")
    cipher = ''
    character_chunks = @message.four_split
    character_chunks.each do |character_chunk|
      index = 0
      character_chunk.each do |character|
        cipher += rotator.rotate(character, @shifts[index])
        index += 1
      end
    end
  end
  
  def four_split
    message_characters = @message.split('')
    split_times = message_characters.length / 4
    split_message = []
    split_times.times do 
      split_message << message_characters.shift(4).join
    end
    split_message << message_characters.join
  end
  
  
end