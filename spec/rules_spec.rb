# frozen_string_literal: true
require_relative '../app/rules'
require_relative '../app/gilded_rose'
require_relative '../app/texttest_fixture'
require 'rspec'


# class testing
describe Rules do
    
    # testing backstage_quality_calculator method 
    describe ".backstage_quality_calculator" do
        it "returns the quality of an item" do
            items = [
                Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 15, quality = 20),
                Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 10, quality = 49),
            ]
            results = [
                Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 15, quality = 20),
                Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 10, quality = 50),
            ]   
            gilded_rose = GildedRose.new items
            (0...2).each do |day|
                gilded_rose.update_quality
            end
            expect(items) == (results)
        end
    end  
end