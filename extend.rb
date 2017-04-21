module Tracking
    def create(name)
        object = new(name)
        instances.push(object)
        return object
    end

    def instances
        @instances ||= []
    end

    def find(name)
        instances.find do |instance|
            instance.name == name
        end
    end
end

class Customer
    # Using the extend keyword makes these methods appear as Class methods, not instance methods. So the methods above can be called direclty on the Customer class.
    extend Tracking

    attr_accessor :name

    def initialize(name)
        @name = name
    end

    def to_s
        "[#{@name}]"
    end
end

puts "Customer.instances: " + Customer.instances.inspect
puts "Customer.create: %s" % Customer.create("Julie")
puts "Customer.create: %s" % Customer.create("Andrew")

puts "Customer.instances: %s" % Customer.instances.inspect
puts "Customer.find: %s" % Customer.find("Julie")
