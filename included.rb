module Fetcher
    # self.included is a class method. This runs automatically when a module is included in a class.
    # The argument that goes in is the class that the module is included into. But class is a reserved word so we use klass instead.
    def self.included(klass)
        puts "Class of #{klass} is now using the Fetcher module."
        # Now we can call other class methods here.
        # attr_accessor is a class method. So now that we have included the class we can call this here.
        attr_accessor :fetch_count, :name
    end

    # fetch is an instance method, you can only call this on a dog instance, not on the Dog class.
    def fetch(item)
        # If fetch count has not been accessed yet, set it to 0
        @fetch_count ||= 0
        @fetch_count += 1
        puts "[#{@name}, Fetch count: #{@fetch_count}] I'll bring that #{item} right back!"
    end
end

class Dog
    # Including this module allows you to access all of the methods associated with that module.
    include Fetcher
    def initialize(name)
        @name = name
    end
end


dog = Dog.new("Fido")
dog.fetch("toy")
dog.fetch("ball")
