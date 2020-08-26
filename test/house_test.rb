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
    house = House.new('$400000', '123 sugar lane')

    assert_equal false, house.above_market_average?
  end

  def test_house_room_categories
    house = House.new('$400000', '123 sugar lane')

    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:bedroom, 11, '15')
    room3 = Room.new(:living_room, 25, '15')
    room4 = Room.new(:basement, 30, '41')

    house.add_room(room1)
    house.add_room(room2)
    house.add_room(room3)
    house.add_room(room4)

    assert_equal [room1, room2], house.rooms_from_category(:bedroom)
    assert_equal [room4], house.rooms_from_category(:basement)
  end

  def test_area
    house = House.new('$400000', '123 sugar lane')

    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:bedroom, 11, '15')
    room3 = Room.new(:living_room, 25, '15')
    room4 = Room.new(:basement, 30, '41')

    house.add_room(room1)
    house.add_room(room2)
    house.add_room(room3)
    house.add_room(room4)

    assert_equal 1_900, house.area
  end

  def test_details
    house = House.new('$400000', '123 sugar lane')
    details = { 'price' => 400_000, 'address' => '123 sugar lane' }

    assert_equal details, house.details
  end

  def test_sq_ft_price
    house = House.new('$400000', '123 sugar lane')

    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:bedroom, 11, '15')
    room3 = Room.new(:living_room, 25, '15')
    room4 = Room.new(:basement, 30, '41')

    house.add_room(room1)
    house.add_room(room2)
    house.add_room(room3)
    house.add_room(room4)

    assert_equal 210.53, house.price_per_square_foot
  end

  def test_sort_by_area
    house = House.new('$400000', '123 sugar lane')

    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:bedroom, 11, '15')
    room3 = Room.new(:living_room, 25, '15')
    room4 = Room.new(:basement, 30, '41')

    house.add_room(room4)
    house.add_room(room1)
    house.add_room(room3)
    house.add_room(room2)

    assert_equal [room4, room3, room2, room1], house.rooms_sorted_by_area
  end

  def test_by_category
    house = House.new('$400000', '123 sugar lane')

    room1 = Room.new(:bedroom, 10, '13')
    room2 = Room.new(:bedroom, 11, '15')
    room3 = Room.new(:living_room, 25, '15')
    room4 = Room.new(:basement, 30, '41')

    house.add_room(room4)
    house.add_room(room1)
    house.add_room(room3)
    house.add_room(room2)

    categories = { bedroom: [room1, room2], living_room: [room3], basement: [room4] }

    assert_equal categories, house.rooms_by_category
  end
end
