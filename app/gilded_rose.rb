# frozen_string_literal: true

require_relative './rules'

# Main class of the exercise for update items
class GildedRose
  def initialize(items)
    @items = items
    @rule = Rules.new
  end

  def update_quality
    @items.each_with_index do |item, index|
      @items[index] = @rule.run_rules(item)
    end
  end
end

# Class item of the exerise
class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
