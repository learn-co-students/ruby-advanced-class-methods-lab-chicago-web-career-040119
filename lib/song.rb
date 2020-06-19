require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create #class constructor
    #@artist_name = artist_name
    song = self.new
    song.save
    song
  end

  def self.all #allows us to display array of all instances
    @@all
  end

  def save
    Song.all << self #also self.class.all << self; self on the right is the instance
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
  song = self.create
  song.name = song_name
  song
  end

  def self.find_by_name(song_name)
     self.all.find{|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
  self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end


  def self.new_from_filename(filename)
    file = filename.split(/ [-] /)
    artist_name = file[0]
    song_name = file[1].split(".mp3").join
#binding.pry
  song = self.new
  song.name = song_name
  song.artist_name = artist_name
  song
  end

  def self.create_from_filename(filename)
    file = filename.split(/ [-] /)
    artist_name = file[0]
    song_name = file[1].split(".mp3").join
#binding.pry
  song = self.create
  song.name = song_name
  song.artist_name = artist_name
  song
  end

  def self.destroy_all
    self.all.clear
  end


end
