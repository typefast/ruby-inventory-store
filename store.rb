module InventoryModule
  
end

class Shirt
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