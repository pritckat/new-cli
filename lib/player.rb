class Player

  attr_accessor :name, :player_url, :team, :role, :signature_hero, :regular_season_team

  @@all = []

  def initialize(name)
    @name = name
    @player_url = "https://liquipedia.net/overwatch/#{@name.capitalize}"
  end

  def self.all
    @@all
  end

end
