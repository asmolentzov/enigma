require './test/test_helper'
require './lib/key'

class KeyTest < Minitest::Test
    
    def test_it_exists
      key = Key.new(key)
      assert_instance_of Key, key
    end
    
    def test_it_can_get_keys_if_given_key
      keys = Key.get_keys('12345')
      expected = [12, 23, 34, 45]
      assert_equal expected, keys
    end
    
    def test_it_can_get_keys_if_given_nil
      keys = Key.get_keys(nil)
      assert_instance_of Array, keys
      assert_equal 4, keys.length
      assert_instance_of Integer, keys.first
      assert_instance_of Integer, keys.last
    end
  
end
