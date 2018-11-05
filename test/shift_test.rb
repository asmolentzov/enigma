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
    assert_equal [21, 30, 43, 51], @shift.shifts
    date = Date.parse('3rd Nov 2018')
    shift = Shift.new(nil, date)
    shifts = shift.shifts
    assert_instance_of Array, shifts
    assert_equal 4, shifts.length
    assert_instance_of Integer, shifts.first
    assert_instance_of Integer, shifts.last
  end
  
  def test_it_can_make_shifts_negative
    assert_equal [-21, -30, -43, -51], @shift.backwards_shifts
  end
  
  def test_it_can_get_last_four_characters
    last_four = Shift.get_last_four('hello world end')
    assert_equal [' ', 'e', 'n', 'd'], last_four
  end
  
  def test_it_can_get_index_differences
    last_four = ['a', 'g', 'q', 'h']
    assert_equal [1, 2, 3, 4], Shift.get_index_differences(last_four)
  end
  
  def test_it_can_get_shifts_from_a_cipher
    cipher = 'aldkajfdslagqh'
    assert_equal [1, 2, 3, 4], Shift.get_cipher_shifts(cipher)
  end
end
