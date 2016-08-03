class Artist
	extend Concerns::Findable
	attr_accessor :name
	attr_reader :songs
	@@all = []

	def initialize(name)
		@name = name
		@songs =[]
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
		self
	end

	def self.create(name)
		Artist.new(name).save
	end

	def add_song(song)
		@songs.push(song) unless @songs.include?(song)
		song.artist = self unless song.artist == self
	end

	def genres
		self.songs.collect{|s| s.genre}.uniq
	end
end