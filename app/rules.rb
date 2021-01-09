class Rules

    private 
    # general class
    def self.run_rules(item)
        type = get_type(item)
        apply_rules(item, type)
    end

    # return item type
    def get_type(item)
        special_products = ['Backstage', 'Aged Brie', 'Sulfuras', 'Conjured']
        special_products.select {|product| product.include? item}
    end

    def apply_rules(item, type)
        case type
        when 'Backstage'
            backstage_quality_calculator(item)
        when 'Aged Brie'
            aged_brie_quality_calculator(item)
        when 'Sulfuras'
            sulfuras_quality_calculator(item)
        when 'Conjured'
            conjured_quality_calculator(item)
        else
            normal_quality_calculator(item)
        end
    end

    # Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
    def backstage_quality_calculator(item)
        item.quality += 2 if item.sell_in <= 10
        item.quality += 3 if item.sell_in <= 5
        item.quality = 0 if item.sell_in <= 0
        
    end

    # "Aged Brie" actually increases in Quality the older it gets the Quality of an item is never more than 50
    def aged_brie_quality_calculator(item, type)
        item.quality += 1 if item.quality < 51
    end

    # Rules for sulfuras (this method defines that Sulfuras cannot be sold and it's quality cannot be less than 80)
    def sulfuras_quality_calculator(item, type)
        item.quality = 80
        item.sell_in = -1
    end
    # Rules for conjured these define that the quality of this item degrades twice as much as a normal item  
    def conjured_quality_calculator(item)
        item.quality -= 2 if item.quality > 0
    end
    # Rules for a normal item these defines that the quality of this item degrades one by one
    def normal_quality_calculator(item, type)
        item.quality -= 1 if item.quality > 0
    end
end
