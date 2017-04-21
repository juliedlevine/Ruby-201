# Part of Ruby Core
# used by classes whose objects may be ordered.


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
