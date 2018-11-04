require './lib/random_number_generator'

class Shift

  include RandomNumber
  attr_reader :key,
              :date
  
  def initialize(key, date)
    @key = get_key(key)
    @date = get_date(date)
  end
  
  def get_date(date)
    if date.is_a? Date
      date.strftime('%d%m%y')
    else 
      date
    end
  end
  
  def get_key(key)
    if key
      key
    else
      random_number_string(Enigma::KEY_LENGTH)
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
    keys = key_split
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