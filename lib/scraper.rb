require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_team_page

    doc = Nokogiri::HTML(open("https://liquipedia.net/overwatch/Overwatch_World_Cup/2018/Rosters"))
    #teams = []
    doc.css(".template-box").each do |teamcard|
      team_url = teamcard.css("b a").attribute("href").value
      team_name = teamcard.css("b a").attribute("title").value
      team = Team.new(team_name, team_url)
      Team.all << team
      #teams << {name: team_name}
    end
    binding.pry
  end
end

#teamcard: doc.css(".template-box")
#team name: doc.css("b a").attribute("title").value
#team url: doc.css("b a").attribute("href").value
