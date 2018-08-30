class CLI

  def initialize
    self.menu
  end

  def menu

    input = ""
    puts "Welcome to Overwatch World Cup Team Overview 2018!"
    puts "To see a list of teams, type 'teams'."
    puts "To see a list of players, type 'players'."
    puts "To see a list of characters, type 'characters'."
    puts "To exit, type 'exit'."
    puts "What would you like to do?"
    while input != 'exit'
      input = gets.strip
      case input
      when 'teams'
        self.list_teams

      when 'players'
        self.list_players

      when 'characters'
        self.list_characters
      when 'exit'
        puts "Goodbye!"
      end
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
