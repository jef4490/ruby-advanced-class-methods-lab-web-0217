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
    x = self.new
    x.save
    # binding.pry
    return x
  end

  def self.new_by_name(title)
    # y = self.create.name=title
    # @@all.last
    song = self.new
    song.name = title
    song
  end

  def self.create_by_name(title)
    # y = self.create.name=title
    # @@all.last
    song = self.create
    song.name = title
    song
  end

  def self.find_by_name(str)
    all.detect{|obj| obj.name == str}
  end

  def self.find_or_create_by_name(str)
    if all.include?(str)
      self.find_by_name(str)
    else
      self.create_by_name(str)
    end
  end

  def self.alphabetical
    all.sort {|y, z| y.name <=> z.name}
  end

  def self.new_from_filename(file)
    y = file.split(" - ")
    x = y.detect{|str| str.include?("mp3")}.chomp!(".mp3")
    song = self.new
    song.name = y[1]
    # binding.pry
    song.artist_name = y[0]
    song
    # binding.pry
  end

  def self.create_from_filename(file)
    y = file.split(" - ")
    x = y.detect{|str| str.include?("mp3")}.chomp!(".mp3")
    song = self.create
    song.name = y[1]
    # binding.pry
    song.artist_name = y[0]
    song
    # binding.pry
  end

  def self.destroy_all
    @@all.clear
  end


end
