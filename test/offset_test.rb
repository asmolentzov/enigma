require './test/test_helper'
require './lib/offset'

class OffsetTest < Minitest::Test
  
  def test_it_exists
    offset = Offset.new('121212')
    assert_instance_of Offset, offset
  end
  
  def test_it_can_create_offsets
    offset = Offset.new('230714')
    assert_equal [9, 7, 9, 6], offset.create_offsets
  end
  
  def test_it_can_create_offset_from_date_object
    date = Date.parse('3rd Nov 2018')
    offset = Offset.new(date)
    assert_equal [9, 9, 2, 4], offset.create_offsets
  end
  
  def test_it_can_create_date_string_from_date_object
    date = Date.parse('3rd Nov 2018')
    offset = Offset.new(date)
    assert_equal '031118', offset.date
  end
  
end
