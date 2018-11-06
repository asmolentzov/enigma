require './test/test_helper'
require './lib/crack'

class CrackTest < Minitest::Test
  
  def test_it_exists
    cipher = 'hello world end'
    date = Date.parse('5th Nov 2018')
    crack = Crack.new(cipher, date)
    assert_instance_of Crack, crack
  end
  
end
