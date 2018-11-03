require './test/test_helper'
require './lib/shift'

class ShiftTest < Minitest::Test
  
  def setup
    @shift = Shift.new('12345', '230714')
  end
  
  def test_it_exists
    assert_instance_of Shift, @shift
  end
  
  def test_it_has_attributes
    assert_equal '12345', @shift.key
    assert_equal '230714', @shift.date
  end
  
  def test_it_can_split_up_key
    assert_equal [12, 23, 34, 45], @shift.key_split
  end
  
  def test_it_can_create_offsets
    assert_equal [9, 7, 9, 6], @shift.create_offsets
  end
  
  def test_it_can_create_offset_from_date_object
    date = Date.parse('3rd Nov 2018')
    shift = Shift.new('12345', date)
    assert_equal [9, 9, 2, 4], shift.create_offsets
  end
  
  def test_it_can_get_shifts
    assert_equal [21, 30, 43, 51], @shift.get_shifts
    date = Date.parse('3rd Nov 2018')
    shift = Shift.new(nil, date)
    shifts = shift.get_shifts
    assert_instance_of Array, shifts
    assert_equal 4, shifts.length
    assert_instance_of Integer, shifts.first
    assert_instance_of Integer, shifts.last
  end
  
  def test_it_can_create_date_string_from_date_object
    date = Date.parse('3rd Nov 2018')
    shift = Shift.new('12345', date)
    assert_equal '031118', shift.get_date(date)
    date_2 = '121212'
    shift_2 = Shift.new('12345', date_2)
    assert_equal '121212', shift_2.get_date(date_2)
  end
  
  def test_it_can_generate_random_key_if_none_given
    shift = Shift.new(nil, '121212')
    assert_instance_of String, shift.get_key(nil)
    assert_equal 5, shift.get_key(nil).length
    assert_instance_of Integer, shift.get_key(nil).to_i
    key_1 = shift.get_key(nil)
    key_2 = shift.get_key(nil)
    refute key_1 == key_2
  end
end
