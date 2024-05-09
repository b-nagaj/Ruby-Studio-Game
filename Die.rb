
# contains the Die class

require_relative 'Player.rb'
require 'test/unit'

class Die 

    attr_reader :number

    def initialize # constructor
        @number = -1
    end

    def roll # generate a random number between 1 and 6 and assign it to number
        @number = rand(1..6)
    end

    def testRandomness
        srand(1)
        roll
        firstRoll = @number

        srand(2)
        roll
        secondRoll = @number

        if (firstRoll == secondRoll)
            return false
        else
            return true
        end
     end
    
end