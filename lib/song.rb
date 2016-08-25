class Song < Base
  attr_reader :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    super(name)
    self.artist = artist if artist
    self.genre = genre if genre
  end

  def self.new_from_filename(filename)
    filename_parts = filename.gsub(/.mp3/, "").split(" - ")
    artist_name = filename_parts[0]
    song = filename_parts[1]
    genre_name = filename_parts[2]
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    Song.new(song, artist, genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).save
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
  end

  def genre=(genre)
    @genre = genre
    genre.songs << self unless genre.songs.include?(self)
  end

  def to_s
    "#{artist.name} - #{name} - #{genre.name}"
  end
end