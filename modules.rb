# module SimpleModule
#     VERSION = 1.0
# end
#
# # constant resolution operator
# # used to access something within a module
# puts SimpleModule::VERSION

module LaserBots

    class Player
        attr_reader :name
        def initialize(name)
            @name = name
        end
    end

    class Robot
        attr_reader :namedef initialize(name)
        @name = name

        def target_player(player)
            Player.new(name)
        end
    end
end


player = LaserBots::Player.new("Julie")
puts player.name
