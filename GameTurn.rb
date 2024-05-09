
# contains the GameTurn class

class GameTurn

    def blamOrW00tPlayer (player)
        die = Die.new
        die.roll

        if (die.number == 1 || die.number == 2)
            player.blam
         elsif (die.number == 3 || die.number == 4) 
            puts ("\n-> #{player.playerName} was skipped")
        else
            player.w00t
        end
    end

    def findRandomTreasure (player)
        treasures = TreasureTrove::TREASURES
        randomTreasure = treasures.sample
        player.foundTreasure(randomTreasure)
    end

end