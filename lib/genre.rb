class Genre
	extend Concerns::Findable
	attr_accessor :name, :songs
	@@all = []

	def initialize(name)
		@name = name
		@songs = []
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
		Genre.new(name).save
	end

	def add_song(song)
		@songs.push(song) unless @songs.include?(song)
	end

	def artists
    self.songs.collect{|s| s.artist}.uniq
  end
end