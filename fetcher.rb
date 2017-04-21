#By including the fetcher module, all methods inside the module are now inclued (or mixed in) with that class.
module Fetcher
    def fetch(item)
        puts "I'll bring that #{item} right back!"
    end
end

class Dog
    include Fetcher
    def initialize(name)
        @name = name
    end
end

class Cat
    include Fetcher
    def initialize(name)
        @name = name
    end
end

dog = Dog.new("Fido")
cat = Cat.new("Olive")
dog.fetch("ball")
cat.fetch("laser pointer")
