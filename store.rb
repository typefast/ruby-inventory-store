module InventoryModule
  
  def self.included(klass)
    klass.extend(ClassMethods)
    klass.extend(Enumerable)
  end
  
  module ClassMethods
    def create(attributes)
      object = new(attributes)
      instances.push(object)
      return object
    end
    
    def instances
      @instances ||= []
    end
    
    def each(&block)
      instances.each(&block)
    end
    
    def in_stock_report
      puts "#{self.to_s} In Stock Report"
      reportable = instances.select{ |instance| instance.in_stock? }
      reportable.each do |item|
        line = []
        line.push("item: #{item.attributes[:name]}")
        line.push("Stock: #{item.stock_count}")
        if item.attributes.include?(:size)
          line.push("Size: #{item.attributes[:size]}")
        end
        puts line.join("\t")
      end
      puts "\n"
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
  include InventoryModule
  attr_accessor :attributes
  
  def initialize(attributes)
    @attributes = attributes
  end
end

class Trousers
  include InventoryModule
  attr_accessor :attributes
  
  def initialize(attributes)
    @attributes = attributes
  end
end

class Accessory
  include InventoryModule
  attr_accessor :attributes
  
  def initialize(attributes)
    @attributes = attributes
  end
end

shirt1 = Shirt.create(name: "POLO", size: "L")
shirt2 = Shirt.create(name: "POLO", size: "M")
shirt1.stock_count = 10
shirt2.stock_count = 3

jeans = Trousers.create(name: "Jeans", size: "32")
jeans.stock_count = 4

accessory = Accessory.create(name: "Belt", size: "M")
accessory.stock_count = 7

accessory = Accessory.create(name: "Necklace")
accessory.stock_count = 2

puts "Shirt 1 stock count: %s" % shirt1.stock_count
puts "Shirt 2 stock count: %s" % shirt2.stock_count
puts "Shirt 1 in stock? %s" % shirt1.in_stock?

Shirt.in_stock_report

