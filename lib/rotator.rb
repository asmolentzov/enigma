class Rotator
  
  attr_reader :character_set
  
  def initialize(character_set)
    @character_set = character_set
  end
  
  def rotate_character(character, amount)
    if @character_set.include? character
      index = @character_set.find_index(character)
      rotated = @character_set.rotate(amount)
      rotated[index]
    else
      character
    end
  end
end
