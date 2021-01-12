# frozen_string_literal: true

require_relative '../app/rules'
require_relative '../app/gilded_rose'
require 'rspec'

# class testing
describe Rules do
  # testing backstage_quality_calculator method
  describe '.backstage_quality_calculator' do
    it 'returns the quality of an item' do
      items = [
        Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 20),
        Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 49)
      ]
      gilded_rose = GildedRose.new items
      2.times { gilded_rose.update_quality }
      expect(items).to match_array([
                                     have_attributes(name: 'Backstage passes to a TAFKAL80ETC concert', sell_in: 15,
                                                     quality: 20),
                                     have_attributes(name: 'Backstage passes to a TAFKAL80ETC concert', sell_in: 10,
                                                     quality: 50)
                                   ])
    end
  end

  describe '.aged_brie_quality_calculator' do
    it 'returns the incresed quality of an item' do
      items = [
        Item.new('Aged Brie', 2, 10),
        Item.new('Aged Brie', 2, 0),
        Item.new('Aged Brie', 2, 40),
        Item.new('Aged Brie', 2, 60)
      ]
      gilded_rose = GildedRose.new items
      2.times { gilded_rose.update_quality }
      expect(items).to match_array([
                                     have_attributes(name: 'Aged Brie', sell_in: 2, quality: 12),
                                     have_attributes(name: 'Aged Brie', sell_in: 2, quality: 2),
                                     have_attributes(name: 'Aged Brie', sell_in: 2, quality: 42),
                                     have_attributes(name: 'Aged Brie', sell_in: 2, quality: 50)
                                   ])
    end
  end

  describe '.sulfuras_quality_calculator' do
    it 'ever return 80 of quality' do
      items = [
        Item.new('Sulfuras, Hand of Ragnaros', 0, 90),
        Item.new('Sulfuras, Hand of Ragnaros', -1, 50)
      ]
      gilded_rose = GildedRose.new items
      2.times { gilded_rose.update_quality }
      expect(items).to match_array([
                                     have_attributes(name: 'Sulfuras, Hand of Ragnaros', sell_in: -1, quality: 80),
                                     have_attributes(name: 'Sulfuras, Hand of Ragnaros', sell_in: -1, quality: 80)
                                   ])
    end
  end

  describe '.conjured_quality_calculator' do
    it 'return item conjured with -2 of quality per day' do
      items = [
        Item.new('Conjured Mana Cake', 3, 20),
        Item.new('Conjured Mana Cake', 3, 20)
      ]
      gilded_rose = GildedRose.new items
      2.times { gilded_rose.update_quality }
      expect(items).to match_array([
                                     have_attributes(name: 'Conjured Mana Cake', sell_in: 3, quality: 16),
                                     have_attributes(name: 'Conjured Mana Cake', sell_in: 3, quality: 16)
                                   ])
    end
  end
  
  describe '.normal_quality_calculator' do
    it 'return normal item with -1 quality per day' do
      items = [
        Item.new('Normal item of Landlord',3,10),
        Item.new('Normal item of Landlord',2,5)
      ]
      gilded_rose = GildedRose.new items
      2.times { gilded_rose.update_quality }
      expect(items).to match_array([
                                     have_attributes(name: 'Normal item of Landlord', sell_in: 3, quality: 8),
                                     have_attributes(name: 'Normal item of Landlord', sell_in: 2, quality: 3)
                                   ])
    end
  end
end
