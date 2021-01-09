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

    #calculate max quality 50 
    # if sulfura == 80
    def check_quality_max(item, type)
        item.quality = 50 if item.quality > 50
        item.quality = 80 if type == 'Sulfuras'
    end

    # calculate min quality (always 0 not negative numbers)
    
    def check_quality_min(item)
        
    end

    #
    def backstage_quality_calculator
    end

    def aged_brie_quality_calculator
    end

    def sulfuras_quality_calculator
    end

    def conjured_quality_calculator
    end

    def normal_quality_calculator
    end
end
