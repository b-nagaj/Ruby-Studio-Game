
# contains the Player class

class Player 

    attr_reader :playerName
    attr_reader :playerHealth

    def initialize (playerName, playerHealth=100) # constructor 
        @playerName = playerName.capitalize

        @playerHealth = playerHealth
        @initialPlayerScore = playerName.length + playerHealth

        @foundTreasures = Hash.new(0)
        @treasurePoints = 0
    end

    def greetPlayer # greeting/welcome message
        puts ("Hello #{@playerName}, your health is #{@playerHealth}, and your score is #{@initialPlayerScore}")
    end

    def blam # decrease a player's health by 10 points
        puts ("\n-> #{@playerName} got blammed")
        @playerHealth = @playerHealth - 10
    end

    def w00t # increase a player's health by 15 points
        puts ("\n-> #{@playerName} got w00ted")
        @playerHealth = @playerHealth + 15
    end

    def foundTreasure (treasure)
        @foundTreasures[treasure.name] += treasure.points
        puts ("\n-> #{@playerName} found a #{treasure.name} worth #{treasure.points} points")
    end

    def totalScore
        currentScore = score()
        treasurePoints = @foundTreasures.values.reduce(0, :+)

        totalScore = currentScore + treasurePoints
        return totalScore
    end

    def score # calculate a player's score
        playerScore = @playerHealth + @playerName.length
        return playerScore
    end

    def to_s # print a player's statistics to the console 
        return "\n\t#{@playerName}:\n\t\thealth: #{@playerHealth}\n\t\tscore: #{totalScore}"
    end
    
end