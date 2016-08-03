class Song
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
		@@all
	end

	def save
		@@all.push(self)
		@@all
	end

	def self.create(name)
		Song.new(name).save
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

	def self.find_by_name(name)
    self.all.detect{|s| s.name == name}
  end

  def self.create(name, artist = nil, genre = nil)
    new(name, artist, genre).tap{|s| s.save}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create(name)
  end


end