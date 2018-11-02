require './test/test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test
  
  def setup
    @shift = Shift.new('12345', '230714')
  end
  
  def test_it_exists
    assert_instance_of Shift, @shift
  end
  
  def test_it_can_split_up_key
    assert_equal [12, 23, 34, 45], @shift.key_split
  end
  
  
end
