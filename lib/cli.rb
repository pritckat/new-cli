class Cli

  @@all = []

  def initialize
    Scraper.scrape_team_page
    @@all << self
    self.menu
  end

  def self.all
    @@all
  end

  def menu

    input = ""
    puts "Welcome to Overwatch World Cup Team Overview 2018!"
    puts "To see a list of teams, type 'teams'."
    puts "To see a list of players, type 'players'."
    puts "To exit, type 'exit'."
    puts "What would you like to do?"
    input = gets.strip
    case input
    when 'teams'
      self.list_teams

    when 'players'
      self.list_players

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
        selected = Team.all[index]
        Scraper.scrape_team_profile(selected)
        selected.apply_attributes
        puts "#{selected.name}"
        puts "================="
        puts "Region: #{selected.region}"
        puts "Coach: #{selected.coach}"
        puts "Players:"
        selected.roster.each do |player|
          puts "#{player.name}"
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
      signature_heroes = selected.signature_hero.join(", ")
      puts "Regular Season Team: #{selected.regular_season_team}"
      puts "Role: #{selected.role}"
      puts "Signature Heroes: #{signature_heroes}"
      puts "Liquipedia Page: #{selected.player_url}"
      puts "Would you like to see another player? Y/n"
      new_input = gets.strip
      if new_input == 'Y' || new_input == 'y'
        list_player_information
      else
        menu
      end
    end
  end

end
