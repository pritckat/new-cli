class Team

  attr_accessor :name, :url, :roster, :coach, :region

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @roster = []
  end

  def self.all
    @@all
  end

  def apply_attributes
    information = Scraper.scrape_team_profile(self)
    information.each_with_index do |info, i|
      if info == "Region:"
        self.region = information[i + 1]
      elsif info == "Coaches:"
        self.coach = information[i + 1]
      end
    end
    binding.pry
  end

end
