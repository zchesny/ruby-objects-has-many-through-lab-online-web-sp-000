class Doctor

  attr_accessor :name

  @@all = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def self.all
    @@all
  end

  def appointments
    Song.all.select{|song| song.artist == self}
  end

  def genres
    self.songs.collect{|song| song.genre}.uniq
  end

  def new_song(name, genre)
    Song.new(name, self, genre)
  end

end
