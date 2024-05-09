
# unit testing for the Game class

require_relative 'Player'
require_relative 'Game'

describe Game do
    
    before do
        @gameTitle = "theGang"
        @theGang = Game.new("theGang")
        @player1 = Player.new("moe", 100)
    end

    it "The game's title is initialized appropriatley" do 
        expect(@theGang.gameTitle).to eq(@gameTitle)
    end

    it "The gamePlayers array is initialized as an empty array" do
        expect(@theGang.gamePlayers).to eq([])
    end

    it "Players are added one by one to the array, increasing the array's size by 1 each time" do
        @theGang.addPlayer(@player1)
        expect(@theGang.gamePlayers.length).to eq(1)
    end

end

context "In a collection of players" do 

    before do 
        @player1 = Player.new("moe", 100)
        @player2 = Player.new("larry", 200)
        @player3 = Player.new("curly", 300)

        @theGang = Game.new("theGang") 
    
        @theGang.addPlayer(@player1)
        @theGang.addPlayer(@player2)
        @theGang.addPlayer(@player3)
    end

    it "The collection of players is sorted in descending order when sortPlayers is called" do
        @theGang.sortPlayers
        expect(@theGang.gamePlayers).to eq([@player3, @player2, @player1])
    end

end

