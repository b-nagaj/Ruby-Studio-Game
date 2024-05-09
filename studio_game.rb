   
# driver file that implements the Game and Player classes

require_relative 'Game.rb'

def main 

    theGang = Game.new("theGang") 

    filename = "players.csv"
    theGang.loadPlayers (filename )

    loop do
       puts "\nHow many rounds would you like to play (type 'quit')"
       answer = gets.chomp.downcase
       
       case answer 
       when "quit"
        theGang.printStats
        theGang.save
        theGang.goodbyeMessage
        break
        when /^\d+$/
        theGang.play(answer.to_i)
        else
            puts "\n*******************************************************"
            puts "Error: you must enter an integer value for (rounds)"
            puts "*******************************************************\n"
       end
    end

end

main