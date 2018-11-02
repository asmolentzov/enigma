class Shift
  
  def initialize(key, date)
    @key = key
    @date = date
  end
  
  def key_split
    key_characters = @key.split('')
    split = []
    i = 0
    (@key.length - 1).times do 
      split << (key_characters[i] + key_characters[i + 1]).to_i
      i += 1
    end
    split
  end
  
end