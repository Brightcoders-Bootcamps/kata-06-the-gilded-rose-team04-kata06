class Rules
    def initialize(item)
        run_rules(item)
    end

    private 
    #general class
    def run_rules(item)
        type = get_type(item)
        apply_rules(item, type)
    end

    #return item type
    def get_type(item)
        special_products = ['Backstage', 'Aged Brie', 'Sulfuras', 'Conjured']
        special_products.select {|product| product == item}
    end

    def apply_rules(item, type)
        case type
        when 'Backstage'
            backstage_quality_calculator
        when 'Aged Brie'
            aged_brie_quality_calculator
        when 'Sulfuras'
            sulfuras_quality_calculator
        when 'Conjured'
            conjured_quality_calculator
        else
            "do default action"
        end
    end

    #Backstage passes aumenta a 2 cuando Sellin <= 10 or aumentan en 3 si Sellin <=5 if sellin < 1 entonces 0
    def backstage_quality_calculator(item)
        item.quality += 2 if item.sell_in - item.quality <= 10
        item.quality += 3 if item.sell_in - item.quality <= 5
    end

    #Aged Brie aumenta su calidad en cada iteracion  en no mas de 50 -> Regla tipo propiedad
    def aged_brie_quality_calculator(item, type)
        item.quality += 1 if item.quality < 51
    end

    def sulfuras_quality_calculator(item, type)
        item.quality = 80
        item.sell_in = -1
    end

    def conjured_quality_calculator(item)
        item.quality -= 2 if item.quality > 0
    end

    def normal_quality_calculator(item, type)
        item.quality -= 1 if item.quality > 0
    end
end
