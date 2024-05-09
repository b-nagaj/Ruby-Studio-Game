
# contains the Game class 

require_relative 'Player.rb'
require_relative 'Die.rb'
require_relative 'GameTurn.rb'
require_relative 'treasure_trove.rb'

class Game

    attr_reader :gameTitle
    attr_reader :gamePlayers

    def initialize (gameTitle) # constructor
        @gameTitle = gameTitle
        @gamePlayers = []
    end

    def addPlayer (player) # add a player to the game
        @gamePlayers.push (player)
    end

    def loadPlayers (filename = "players.csv")
        File.readlines(filename).each do |line|
            name, health = line.split(',')
            player = Player.new(name, Integer(health))
            addPlayer(player)
        end
    end

    def welcomeMessage #display the welcome message
        puts ("\n")
        puts ("Welcome To Bryce's Ruby Game".upcase.center(55, "*"))
        puts ("\n*******************************************************")
        puts ("\nThere are #{@gamePlayers.length} players in \'#{@gameTitle}\': \n\n")
        @gamePlayers.each { |player| player.greetPlayer}
        puts ("\n*******************************************************\n")
    end

    def printTreasuresToBeFound
        treasures = TreasureTrove::TREASURES
        puts ("\nThere are #{treasures.size} treasures to be found:\n\n")
        treasures.each { |treasure| puts ("A #{treasure.name} is worth #{treasure.points} points")}
        puts ("\n*******************************************************\n")
    end

    def play (rounds = 3) # play the game. That is, display a welcome message, and randomly generate blams/woots
        welcomeMessage
        printTreasuresToBeFound

        1.upto(rounds) do |round| 
            currentTurn = GameTurn.new

            puts "\nROUND: #{round}"

            @gamePlayers.each do |player|
                currentTurn.blamOrW00tPlayer (player)
                currentTurn.findRandomTreasure (player)
                puts player
            end
            puts ("\n*******************************************************\n")
        end
    end

    def sortPlayers # sort the players in descending order with respect to score
        @gamePlayers = @gamePlayers.sort_by { |player| player.totalScore }
        @gamePlayers = @gamePlayers.reverse
        return @gamePlayers.reverse
    end

    def printStats # display a summary of the players' scores
        sortPlayers
        puts("\n")
        puts ("\'#{@gameTitle}\' High Scores:".center(55, " "))
        puts ("\n")
        @gamePlayers.each { |player| puts ("#{player.playerName.ljust(50, ".")} #{player.totalScore}") }
    end

    def saveHighScores (filename = "high_scores.txt")
        scoresFile = File.open(filename, "w")

        scoresFile.syswrite("\n")
        scoresFile.syswrite("\'#{@gameTitle}\' High Scores:".center(55, " "))
        scoresFile.syswrite("\n\n")
        @gamePlayers.each { |player| scoresFile.syswrite("#{player.playerName.ljust(50, ".")} #{player.totalScore}\n") }

        scoresFile.close
    end

    def goodbyeMessage # display the goodbye message 
        puts ("\n")
        puts ("Thanks for playing!".upcase.center(55, "*"))
        puts ("\n")
    end
    
end