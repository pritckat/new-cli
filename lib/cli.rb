class CLI

  def initialize
    puts "Welcome to Overwatch World Cup Team Overview 2018!"
    puts "To see a list of teams, type 'teams'."
    puts "To see a list of players, type 'players'."
    puts "To see a list of characters, type 'characters'."
    puts "To exit, type exit."
    puts "What would you like to do?"
    input = gets.strip
    if input == 'teams'

    elsif input == 'players'

    elsif input == 'characters'
    end
    until input == 'exit'
      input = gets.strip
    end

  end


end
