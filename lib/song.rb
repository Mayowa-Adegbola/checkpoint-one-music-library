class Song
	attr_accessor :name
	attr_reader :artist
	@@all = []

	def initialize(name, artist = nil)
		@name = name
		self.artist = artist if artist
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
end