require "sinatra"
# Set Sinata up to accept connections from any computer
set :bind, "0.0.0.0"

get("/apple") do
    "<h1>Here's a juicy apple.</h1>"
end

get("/banana") do
    "<h1>Here's a ripe banana.</h1>"
end

get("/carrot") do
    "<h1>Here's a crunchy carrot.</h1>"
end
