require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper

  def self.scrape_team_page

    @doc = Nokogiri::HTML(open("https://liquipedia.net/overwatch/Overwatch_World_Cup/2018/Rosters"))
    removable = @doc.css(".team-template-team-part")
    removable.remove
  #  binding.pry
    @doc.css(".template-box").each do |teamcard|
      team_url = teamcard.css("b a").attribute("href").value
      url = "https://liquipedia.net#{team_url}"
      team_name = teamcard.css("b a").attribute("title").value
      team = Team.new(team_name, url)
      Team.all << team
      teamcard.css(".teamcard-inner table tbody tr td").each do |t|
        player_name = t.css("a").text
        if player_name != ""
          player = Player.new(player_name)
          Player.all << player
          team.roster << player
          player.team = team
        end
      end
    end

  end

  def self.scrape_profile_page(player)

    @profile_page = Nokogiri::HTML(open(player.player_url))
    information = []
    @profile_page.css(".infobox-cell-2").each do |info|
      information << info.text
    end
    information

  end

  def self.scrape_team_profile(team)

    @team_page = Nokogiri::HTML(open(team.url))
    information = []
    @team_page.css(".infobox-cell-2").each do |info|
      information << info.text
    end
    information

  end

end
