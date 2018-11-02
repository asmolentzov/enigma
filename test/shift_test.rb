require 'test/test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test
  
  def test_it_exists
    shift = Shift.new('12345', '230714')
    assert_instance_of Shift, shift
  end
  
  
  
end
