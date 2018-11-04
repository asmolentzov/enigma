class Codebook
  
  def self.encrypt()
    
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
end