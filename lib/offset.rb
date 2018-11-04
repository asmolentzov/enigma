class Offset
  
  attr_reader :date
  
  def initialize(date)
    if date.is_a? Date
      @date = date.strftime('%d%m%y')
    else 
      @date = date
    end
  end
  
  def create_offsets
    
  end
  
end