
# unit testing for the player class

require_relative 'Player.rb'

describe Player do

    before do
        @initial_health = 150
        @player = Player.new("larry", @initial_health)

        $stdout = StringIO.new
    end

    it "Has a capitalized name" do
        expect(@player.playerName).to eq(@player.playerName.capitalize)
    end

    it "Has an initial health" do
        expect(@player.playerHealth).to eq(@initial_health)
    end

    it "Has a string representation" do
        expect(@player.to_s).to eq("\n\t#{@player.playerName}:\n\t\thealth: #{@player.playerHealth}\n\t\tscore: #{@player.score}")
    end

    it "Computes a score as the sum of its health and length of name" do
        expect(@player.score).to eq(@player.playerName.length + @player.playerHealth)
    end

    it "Increases health by 15 when W00ted" do
        expect(@player.w00t).to eq(@initial_health + 15)
    end

    it "decreases health by 10 when blammed" do
        expect(@player.blam).to eq(@initial_health - 10)
    end
    
end
