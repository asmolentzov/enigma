require './test/test_helper'
require './lib/shift'
require './lib/enigma'

class ShiftTest < Minitest::Test
  
  def setup
    @shift = Shift.new('12345', '230714')
  end
  
  def test_it_exists
    assert_instance_of Shift, @shift
  end
  
  def test_it_has_date
    assert_equal '230714', @shift.date
  end
  
  def test_it_can_return_key_value
    assert_equal '12345', @shift.key
  end
  
  def test_it_can_get_shifts
    assert_equal [21, 3, 16, 24], @shift.shifts
    date = Date.parse('3rd Nov 2018')
    shift = Shift.new(nil, date)
    shifts = shift.shifts
    assert_instance_of Array, shifts
    assert_equal 4, shifts.length
    assert_instance_of Integer, shifts.first
    assert_instance_of Integer, shifts.last
  end
  
  def test_it_can_make_shifts_negative
    assert_equal [-21, -3, -16, -24], @shift.backwards_shifts
  end
end
