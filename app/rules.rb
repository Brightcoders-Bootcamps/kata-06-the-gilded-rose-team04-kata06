# frozen_string_literal: true

# Rules class manage and moduralize the bussiness rules
class Rules
  def initialize
    @products = { backstage_quality_calculator: 'Backstage', aged_brie_quality_calculator: 'Aged Brie',
                  sulfuras_quality_calculator: 'Sulfuras', conjured_quality_calculator: 'Conjured' }
  end

  # general class
  def run_rules(item)
    apply_rules(item)
  end

  private

  # The method search type item is and call rule by the type item.
  def apply_rules(item)
    action = @products.select { |_key, product| item.name.include? product }
    action = { normal_quality_calculator: item } if action.empty?
    send(action.keys[0].to_s, item)
  end

  # Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days
  def backstage_quality_calculator(item)
    item.quality += 2 if item.sell_in <= 10
    item.quality += 3 if item.sell_in <= 5
    item.quality = 0 if item.sell_in <= 0
    item.quality = 50 if item.quality > 50
    item
  end

  # "Aged Brie" actually increases in Quality the older it gets the Quality of an item is never more than 50
  def aged_brie_quality_calculator(item)
    item.quality += 1 if item.quality < 51
    item.quality = 50 if item.quality > 50
    item
  end

  # Rules for sulfuras (this method defines that Sulfuras cannot be sold and it's quality cannot be less than 80)
  def sulfuras_quality_calculator(item)
    item.quality = 80
    item.sell_in = -1
    item
  end

  # Rules for conjured these define that the quality of this item degrades twice as much as a normal item
  def conjured_quality_calculator(item)
    item.quality -= 2 if item.quality.positive?
    item
  end

  # Rules for a normal item these defines that the quality of this item degrades one by one
  def normal_quality_calculator(item)
    item.quality -= 1 if item.quality.positive?
    item
  end
end
