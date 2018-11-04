require './lib/key'

class Shift

  attr_reader :date
  
  def initialize(key, date)
    @key = Key.new(key)
    @date = get_date(date)
  end
  
  def key
    @key.key
  end
  
  def get_date(date)
    if date.is_a? Date
      date.strftime('%d%m%y')
    else 
      date
    end
  end
  
  def create_offsets
    squared_date = @date.to_i ** 2
    last_four = squared_date.to_s[-Enigma::NUMBER_SHIFTS,
                                  Enigma::NUMBER_SHIFTS]
    last_four.split('').map do |char|
      char.to_i
    end
  end
  
  def shifts
    keys = @key.keys
    offsets = create_offsets

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