require "pry"

class Song
#vars################
  ##instance //////////
  attr_accessor :name, :artist_name
  ##class ////////////
  @@all = []

#methods ############
  ##instance //////////
  def initialize(name = "")
    @name = name
  end

  def save
    self.class.all << self
  end

  # def name
  #   @name
  # end
  #
  # def artist_name
  #   @artist_name
  # end

  ##class ////////////

  def self.all
    @@all
  end

  def self.create
    new_song = Song.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    new_song = Song.new(song_name)
  end

  def self.create_by_name(name)
    new_song = self.new(name)
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.find { |song|
      song.name == name
    }
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by { |song|
      song.name.downcase
    }
  end

  def self.new_from_filename(file_name)
    fixed_name = file_name.split(" - ")
    no_ex_name = fixed_name.map {|name| name.slice(0...(name.index(".")))}
    new_song = Song.new(no_ex_name[1])
    new_song.artist_name = no_ex_name[0]
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    new_song.save
    new_song
  end

  def self.destroy_all
    @@all = []
  end

end

#jack = Song.new
#binding.pry
"wut"
