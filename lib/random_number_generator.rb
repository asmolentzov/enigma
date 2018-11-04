module RandomNumber
  def random_number(length)
    number = ''
    length.times do 
      number += rand(9).to_s
    end
    number
  end
end