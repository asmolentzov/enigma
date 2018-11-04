require './lib/random_number_generator'

class Key
  
  include RandomNumber
  
  def self.get_keys(key)
    if key
      self.new(key).keys
    else
      self.new(random_number_string(Enigma::KEY_LENGTH)).keys
    end
  end
  
  def initialize(key)
    @key = key
  end
  
end