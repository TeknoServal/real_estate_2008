# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test
  def test_it_exists_and_has_attributes
    house = House.new('$400000', '123 sugar lane')

    assert_instance_of House, house
    assert_equal 400_000, house.price
    assert_equal '123 sugar lane', house.address
  end
end
