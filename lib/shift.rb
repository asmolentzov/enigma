require './lib/key'
require './lib/offset'

class Shift
  def initialize(key, date)
    @key = Key.new(key)
    @offset = Offset.new(date)
  end
  
  def key
    @key.key
  end
  
  def date
    @offset.date
  end
  
  def shifts
    keys = @key.keys
    offsets = @offset.offsets

    keys.zip(offsets).map do |key_offset|
      key_offset.sum
    end
  end
  
  def backwards_shifts
    shifts.map do |shift|
      -shift
    end
  end
end