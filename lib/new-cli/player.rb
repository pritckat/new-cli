class Player

  attr_accessor :name, :player_url, :team, :role, :signature_hero, :regular_season_team

  @@all = []

  def initialize(name) #creates new Player and formats url
    @name = name
    url_name = name.slice(0,1).capitalize + name.slice(1..-1)
    @player_url = "https://liquipedia.net/overwatch/#{url_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect {|n| n.name == name}
  end

  def apply_attributes
    information = Scraper.scrape_profile_page(self)
    if information != nil
      information.each_with_index do |info, i|
        if info == "Team:"
          self.regular_season_team = information[i + 1]
        elsif info == "Common Team Role(s):"
          self.role = information[i + 1]
        elsif info == "Signature Hero:"
          self.signature_hero = information[i + 1].split
        end
      end
    end
  end

end
