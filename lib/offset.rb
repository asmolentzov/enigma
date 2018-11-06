class Offset
  
  attr_reader :date
  
  def initialize(date)
    if date.is_a? Date
      @date = date.strftime('%d%m%y')
    else 
      @date = date
    end
  end
  
  def offsets
    squared_date = @date.to_i ** 2
    last_four_date_chars = squared_date.to_s[-Enigma::NUMBER_SHIFTS,
                                  Enigma::NUMBER_SHIFTS]
    last_four_date_chars.split('').map do |char|
      char.to_i
    end
  end
  
end