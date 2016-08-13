class Song
	extend Concerns::Findable
	attr_accessor :name
	attr_reader :artist, :genre

	@@all = []

	def initialize(name, artist = nil, genre = nil)
		@name = name
		self.artist = artist if artist
		self.genre = genre if genre
	end

	def self.all
		@@all
	end

  def self.destroy_all
		@@all = []
	end

  def self.new_from_filename(file)
    artist_name, song_name, genre_name = file.gsub(/.mp3/, '').split(' - ')
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    Song.new(song_name, artist, genre)
  end

  def self.create_from_filename(file)
    artist_name, song_name, genre_name = file.gsub(/.mp3/, '').split(' - ')
    artist = Artist.find_or_create_by_name(artist_name)
    genre = Genre.find_or_create_by_name(genre_name)
    Song.new(song_name, artist, genre).save
  end

  def self.create(name)
    new(name).save
  end

  def save
		@@all.push(self)
    self
	end

	def artist= (artist)
		@artist = artist
		@artist.add_song(self)
	end

	def genre= (genre)
		@genre = genre
		@genre.add_song(self)
	end

  def to_s
    "#{artist.name} - #{name} - #{genre.name}"
  end
end
