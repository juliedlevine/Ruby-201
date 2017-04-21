module Inventoryable
    # Class methods to be available in each class
    def self.included(klass)
        klass.extend(ClassMethods)
        klass.extend(Enumerable)
        attr_accessor :attributes
    end

    # Class Methods
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
            puts "\t#{self.to_s} In Stock Report"
            # instances is an array of objects for that class
            # Run in_stock? method on each instance, will return true or false.
            # reportable will be an array of item objects that have returned true form in_stock? method being called on them
            reportable = instances.select do |instance|
                instance.in_stock?
            end
            # iterate over that array and print out each one
            reportable.each do |item|
                line = []
                line.push("Item: #{item.attributes[:name]}")
                line.push("Stock: #{item.stock_count}")
                # Only include size attribute if it exists for that Class (Accessory instances do not have a size attribute)
                if item.attributes.include?(:size)
                    line.push("Size: #{item.attributes[:size]}")
                end
                puts line.join("\t")
            end
        end
    end

    # Instance Methods
    def stock_count
        @stock_count ||= 0
    end
    def stock_count_equals(number)
        @stock_count = number
    end
    def in_stock?
        stock_count > 0
    end

end


# Classes
class Shirt
    include Inventoryable
    def initialize(attributes)
        @attributes = attributes
    end
end
class Pant
    include Inventoryable
    def initialize(attributes)
        @attributes = attributes
    end
end
class Accessory
    include Inventoryable
    def initialize(attributes)
        @attributes = attributes
    end
end

shirt = Shirt.create(name: "MTF", size: "L")
shirt.stock_count_equals(10)

shirt = Shirt.create(name: "MTF2", size: "L")

shirt = Shirt.create(name: "MTF", size: "M")
shirt.stock_count_equals(9)

pant = Pant.create(name: "Jeans", size: "M")
pant.stock_count_equals(2)

pant = Pant.create(name: "Jeans", size: "S")
pant.stock_count_equals(4)

accessory = Accessory.create(name: "Belt", size: "M")
accessory.stock_count_equals(1)

accessory = Accessory.create(name: "Belt", size: "L")
accessory.stock_count_equals(1)

accessory = Accessory.create(name: "Necklace")
accessory.stock_count_equals(1)

Shirt.in_stock_report
Pant.in_stock_report
