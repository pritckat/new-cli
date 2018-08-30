class CLI

  def initialize
    Scraper.scrape_team_page
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

    else
      menu

    end
  end

  def list_teams
    Team.all.each_with_index do |team, index|
      puts "#{index + 1}. #{team.name}"
    end
    puts "Please type the number of the team you'd like to look at."
    puts "Or type 'menu' to return to the main menu."
    input = gets.strip
    if input == 'menu'
      self.menu
    else
      index = input.to_i - 1
      puts Team.all[index]
    end
  end

  def list_players
    Player.all.each_with_index do |player, index|
      puts "#{index + 1}. #{player}"
    end
    puts "Please type the number of the player you'd like to look at."
    puts "Or type 'menu' to return to the main menu."
    input = gets
    if input == 'menu'
      self.menu
    else
      index = input.to_i - 1
      puts Player.all[index]
    end
  end

  def list_characters
    Character.all.each_with_index do |character, index|
      puts "#{index + 1}. #{character}"
    end
    puts "Please type the number of the character you'd like to look at."
    puts "Or type 'menu' to return to the main menu."
    input = gets
    if input == 'menu'
      self.menu
    else
      index = input.to_i - 1
      puts Character.all[index]
    end
  end

end
