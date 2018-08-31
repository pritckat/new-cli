class Team

  attr_accessor :name, :url, :roster

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
    @roster = []
  end

  def self.all
    @@all
  end

end
