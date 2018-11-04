class Shift

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
      key = ''
      Enigma::KEY_LENGTH.times do 
        key += rand(9).to_s
      end
      key
    end
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