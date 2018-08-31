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
    puts "To see a list of characters, type 'heroes'."
    puts "To exit, type 'exit'."
    puts "What would you like to do?"
    input = gets.strip
    case input
    when 'teams'
      self.list_teams

    when 'players'
      self.list_players

    when 'heroes'
      self.list_heroes

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
    puts "Please type the number of the team whose roster you'd like to see."
    puts "Or type 'menu' to return to the main menu."
    input = gets.strip
    if input == 'menu'
      self.menu
    else
      index = input.to_i - 1
      if index >=0 && index <= 24
        puts "#{Team.all[index].name}:"
        Team.all[index].roster.each do |player|
          puts player.name
        end
        list_player_information
      else
        list_teams
      end

    end
  end

  def list_players
    Player.all.each_with_index do |player, index|
      puts "#{index + 1}. #{player.name}"
    end
    list_player_information
  end

  def list_player_information
    puts "Please type the name of the player whose stats you'd like to see."
    puts "Or type 'menu' to return to the main menu."
    input = gets.strip
    if input == 'menu'
      self.menu
    else
      selected = Player.find_by_name(input)
      selected.apply_attributes
      puts selected.name
      puts selected.regular_season_team
      puts selected.role
      puts selected.signature_hero
    end
  end

  def list_heroes
    Hero.all.each_with_index do |hero, index|
      puts "#{index + 1}. #{hero}"
    end
    puts "Please type the number of the hero you'd like to look at."
    puts "Or type 'menu' to return to the main menu."
    input = gets.strip
    if input == 'menu'
      self.menu
    else
      index = input.to_i - 1
      puts Hero.all[index]
    end
  end

end
