require './test/test_helper'
require './lib/key'
require './lib/enigma'

class KeyTest < Minitest::Test
    
    def test_it_exists
      key = Key.new('12345')
      assert_instance_of Key, key
    end
    
    def test_it_can_get_keys_if_given_key
      key = Key.new('12345')
      keys = key.keys
      expected = [12, 23, 34, 45]
      assert_equal expected, keys
    end
    
    def test_it_can_get_keys_if_given_nil
      key = Key.new(nil)
      keys = key.keys
      assert_instance_of Array, keys
      assert_equal 4, keys.length
      assert_instance_of Integer, keys.first
      assert_instance_of Integer, keys.last
    end
    
    def test_it_can_split_up_key
      key = Key.new('12345')
      assert_equal [12, 23, 34, 45], key.keys
    end
    
    def test_it_can_generate_random_number
      key = Key.new('12345')
      number = key.random_number_string(5)
      assert_instance_of String, number
      assert_equal 5, number.length
      assert_instance_of Integer, number.to_i
      number_2 = key.random_number_string(5)
      refute number == number_2
    end
  
end
