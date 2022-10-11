class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      case item.name
      when 'Aged Brie'
        item.sell_in -= 1
        # item.quality += 1 if item.quality < 50
        # item.quality += 1 if item.quality < 50 && item.sell_in < 0
        item.quality += item.quality < 50 && item.sell_in < 0 ? 2 : 1
        item.quality = item.quality > 50 ? 50 : item.quality
      when 'Backstage passes to a TAFKAL80ETC concert'
        # item.quality += 1
        # item.quality += 1 if item.sell_in < 11
        item.quality += 1 if item.sell_in < 6
        item.quality += item.sell_in < 11 ? 2 : 1
        item.quality = item.quality > 50 ? 50 : item.quality
        item.sell_in -= 1
        item.quality = item.sell_in < 0 ? 0 : item.quality
      when 'Sulfuras, Hand of Ragnaros'
      else
        item.sell_in -= 1
        item.quality -= 1 if item.quality > 0
        item.quality -= 1 if item.quality > 0 && item.sell_in < 0
        # item.quality -= item.quality > 0 && item.sell_in < 0 ? 2 : 1
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
