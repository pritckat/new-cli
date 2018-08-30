class Team

  attr_accessor :name, :url

  @@all = []

  def initialize(name, url)
    @name = name
    @url = url
  end

  def self.all
    @@all
  end

end
