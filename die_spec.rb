
# unit testing for the Die class

require_relative 'Die.rb'
require 'test/unit'

describe Die do

    before do
        @die = Die.new
    end

    it "An unrolled die's number is -1" do
        expect(@die.number).to eq(-1) 
    end

    it "rolling the die generates a random number between 1 and 6" do
        def withinRange 
            @die.roll

            if (@die.number.between?(1, 6)) 
                return true
            else
                return false
            end
        end

        expect(withinRange).to eq(true)
    end

    it "the number generated by the roll function is truly random" do
        expect(@die.testRandomness).to eq(true)
    end

end