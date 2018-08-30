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
      self.list_teams

    elsif input == 'players'
      self.list_players

    elsif input == 'characters'
      self.list_characters
    end
    until input == 'exit'
      input = gets.strip
    end

  end

  def list_teams
    puts Team.all
  end

  def list_players
    Player.all
  end

  def list_characters
    Character.all
  end

end
