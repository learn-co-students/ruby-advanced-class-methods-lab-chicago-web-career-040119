class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.all.select {|song| song.name == name}.count > 0
      self.all.find {|song| song.name == name}
    else
      self.find_by_name(name)
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by! {|item| item.name}
  end

  def self.new_from_filename(name)
    song = Song.new
    song.artist_name = name.split(/[-.]/)[0].strip
    song.name = name.split(/[-.]/)[1].strip
    song
  end

  def self.create_from_filename(name)
    song = Song.new
    song.artist_name = name.split(/[-.]/)[0].strip
    song.name = name.split(/[-.]/)[1].strip
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
