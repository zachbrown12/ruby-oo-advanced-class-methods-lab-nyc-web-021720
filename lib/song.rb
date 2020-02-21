require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(songname)
    song = Song.new
    song.name = songname
    song
  end

  def self.create_by_name(songname)
    song = Song.new
    song.name = songname
    song.save
    song
  end

  def self.find_by_name(songname)
    self.all.find{|song| song.name == songname}
  end

  def self.find_or_create_by_name(songname)
    self.find_by_name(songname) || self.create_by_name(songname)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    fnamearr = filename.split(' - ')
    artist = fnamearr[0]
    songname = fnamearr[1].gsub(".mp3", "")

    song = self.new
    song.name = songname
    song.artist_name = artist
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
    song.save
  end

  def self.destroy_all
    @@all.clear
  end

end
