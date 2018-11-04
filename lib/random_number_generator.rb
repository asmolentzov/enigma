module RandomNumber
  def random_number(length)
    number = ''
    length.times do 
      number += rand(9).to_s
    end
    number.to_i
  end
  
  def random_number_string(length)
    random_number(length).to_s
  end
end