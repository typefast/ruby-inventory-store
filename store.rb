module InventoryModule
  
  module ClassMethods
    def create(attributes)
      object = new(attributes)
      instances.push(object)
      return object
    end
    
    def instances
      @instances ||= []
    end
  end
  
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
  extend InventoryModule::ClassMethods
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

shirt1 = Shirt.create(name: "POLO", size: "L")
shirt2 = Shirt.create(name: "POLO", size: "M")

shirt1.stock_count = 10

puts "Shirt 1 stock count: %s" % shirt1.stock_count
puts "Shirt 2 stock count: %s" % shirt2.stock_count
puts "Shirt 1 in stock? %s" % shirt1.in_stock?
