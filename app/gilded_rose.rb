Reglas
1. La calidad de un articulo nunca es superior a 50 -> Regla tipo propiedad
2. La calidad de un articulo nunca es negativa -> Regla tipo propiedad (Ver sulfuro)


3. Backstage passes aumenta a 2 cuando Sellin <= 10 or aumentan en 3 si Sellin <=5 if sellin < 1 entonces 0
4. Aged Brie aumenta su calidad en cada iteracion  en no mas de 50 -> Regla tipo propiedad

5. Sulfuras nunca disminuye su calidad tampoco puede venderse -> Regla tipo propiedad, y EXCEPCIONAL

6. Elemento conjurado se degrada 2 veces mas rapido -> Regla Simple


7. Degradación de 1 en 1 en cada iteracion -> Regla Simpleclass GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      
      
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        #metodo 1
        if item.quality > 0
          if item.name != "Sulfuras, Hand of Ragnaros"
            item.quality = item.quality - 1
          end
        end
        #fin_metodo_1
      else

        if item.quality < 50
          #metodo 2
          item.quality = item.quality + 1
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end


      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end

      
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            if item.quality > 0
              if item.name != "Sulfuras, Hand of Ragnaros"
                item.quality = item.quality - 1
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.quality = item.quality + 1
          end
        end
      end
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

@items.each do |item|
  Rule.
end