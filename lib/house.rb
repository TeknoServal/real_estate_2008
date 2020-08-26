# frozen_string_literal: true

# Describes a house with rooms, a price, and an address
class House
  attr_reader :price, :address, :rooms

  def initialize(price, address)
    @price = price.tr('^0-9', '').to_i
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def above_market_average?
    @price > 500_000
  end

  def rooms_from_category(category)
    @rooms.select { |room| room.category == category }
  end
end
