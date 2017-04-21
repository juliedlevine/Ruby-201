#### Modules
Modules are used to add behavior to classes (Mixin).
Modules follow the same rules as classes.

#### Constants
Like the const variable in JavaScript in that it can't be changed. A constant is declared in all caps.
```Ruby
module SimpleModule
    VERSION = 1.0
end

# constant resolution operator
# used to access something within a module
puts SimpleModule::VERSION
```

#### Comparable module
Used when you want to compare 2 different things in a class. In this case used to compare the scores from 2 different players.
```Ruby
class Player
    include Comparable
    attr_accessor :name, :score
    def <=> (other_player)
        score <=> other_player.score
    end
    def initialize(name, score)
        @name = name
        @score = score
    end
end
player1 = Player.new("Julie", 100)
player2 = Player.new("Kenneth", 80)
puts "Player 1 has more points: %s" % (player1 > player2)
puts "Player 2 has more points: %s" % (player1 < player2)
```

#### More about Modules
By including the fetcher module, all methods inside the module are now included (or mixed in) with that class.
```Ruby
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
```

#### Class methods vs. Instance methods.
Class methods are methods that can be called on the actual class object, like this:
```Ruby
class Dog
    def self.bark
        puts "Woof."
    end
end
```
Here you can call bark directly on the Dog class - like this:
```Ruby
Dog.bark
# Woof.
```
Alternatively, if you tried to call bark on an instance of a Dog class, you would get an error. Apparently you don't use class methods all that much.
```Ruby
dog = Dog.new
dog.bark
# error!
```


#### Ruby Standard Library
The Ruby Standard Library contains larger pieces of functionality and must be specifically imported in to your programs. Some examples of standard library are utility classes for working with dates and times, serialization, network access and more. <br>
Yaml is a package in the standard library that's like pickle. It allows you to save/write/read files.<br>
Benchmark measures the amount of time it takes your program to run.


#### Representing Dates in Ruby
```Ruby
require "date"

puts Date.new(2017, 4, 1)
puts Date.parse("April 21st, 2017")
today = Date.today
```

#### JSON with Ruby
JSON is a plain text serialization format. You don't need any special software to read and write it. JSON started with JavaScript but it's pretty standard for other languages to use it as well.
```Ruby
require "json"
json_string = '{"name": "Julie", "location": "Atlanta"}'
hash = json.parse(json_string)
# This turns the json into a ruby object. We can assign this to a variable and then work with it.
hash["name"]
```


#### Sinatra
Sinatra is a micro web framework (like Express for node.js), it allows you to write web apps for Ruby. Rails is like this but much more complex.
```Ruby
require "sinatra"
# Set Sinata up to accept connections from any computer
set :bind, "0.0.0.0"

get("/apple") do
    "Here's a juicy apple."
end
```


#### ERB Templates (like Handlebars)
Loads a static HTML file from your views folder and allows you to embed Ruby code for dynamic data.
```Ruby
get("/") do
    erb :welcome
end
```
Conditionals with ERB
```HTML
<% grade = 97 %>
<% if grade > 60 %>
    <p>You passed!</p>
<% end %>
```

Loops with ERB
```HTML
<% 3.times do %>
    <p>Write this 3 times.</p>
<% end %>
```

This code loops through each value in the array and passes it to the number argument in the block. the output embedding tag gets evaluated.
```HTML
<% [1, 5, 25].each do |number| %>
    <p> <%= number %> fish </p>
<% end %>
```
