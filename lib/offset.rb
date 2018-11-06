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
    offsets = squared_date.to_s[-Enigma::NUMBER_SHIFTS,
                                  Enigma::NUMBER_SHIFTS]
    offsets.split('').map do |char|
      char.to_i
    end
  end
  
end