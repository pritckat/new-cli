require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_team_page

    doc = Nokogiri::HTML(open("https://liquipedia.net/overwatch/Overwatch_World_Cup/2018/Rosters"))

    binding.pry
  end
end

#team name: doc.css("b a").attribute("title").value
