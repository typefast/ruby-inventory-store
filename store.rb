module InventoryModule
  
  def stock_count
    @stock_count ||= 0
  end
  
  def stock_count=(number)
    @stock_count = number
  end
  
  def in_stock?
    stock_count > 0
  end
end

class Shirt
  include InventoryModule
  attr_accessor :attributes
  
  def initialize(attributes)
    @attributes = attributes
  end
end

class Trousers
  attr_accessor :attributes
  
  def initialize(attributes)
    @attributes = attributes
  end
end

class Accessory
  attr_accessor :attributes
  
  def initialize(attributes)
    @attributes = attributes
  end
end

shirt = Shirt.new(name: "POLO", size: "L")
shirt2 = Shirt.new(name: "POLO", size: "M")

shirt.stock_count = 10

puts "Shirt 1 stock count: %s" % shirt.stock_count
puts "Shirt 2 stock count: %s" % shirt2.stock_count
puts "Shirt 1 in stock? %s" % shirt.in_stock?
