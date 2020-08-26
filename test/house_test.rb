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
    assert_equal [], house.rooms
  end

  def test_can_add_rooms
    house = House.new('$400000', '123 sugar lane')
    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:pedroom, 11, '15')

    house.add_room(room1)
    house.add_room(room2)

    assert_equal [room1, room2], house.rooms
  end

  def test_market_average
    # house = House.new("$400000", "123 sugar lane")
    # room1 = Room.new(:bedroom, 10, '13')
    # room2 = Room.new(:bedroom, 11, '15')
    # room3 = Room.new(:living_room, 25, '15')
    # room4 = Room.new(:basement, 30, '41')

    assert_equal false, house.above_market_average
  end
end
