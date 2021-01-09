require_relative './rules'
class GildedRose

  def initialize(items)
      @items = items
  end

  def update_quality()
    @items.each do |item|
      Rules.run_rules(item)
    end
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
