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

  def self.find_by_name(name)
    self.all.detect {|n| n.name == name}
  end

  def apply_attributes
    information = Scraper.scrape_profile_page(self)
    information.each_with_index do |info, i|
      if info == "Team:"
        self.regular_season_team = information[i + 1]
      elsif info == "Common Team Role(s):"
        self.role = information[i + 1]
      elsif info == "Signature Hero:"
        self.signature_hero = information[i + 1]
      end
    end
  end

end
