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
	end

	def self.create(name)
		new(name).save
	end

	def save
		@@all.push(self)
		self
	end

	def add_song(song)
		@songs.push(song) unless @songs.include?(song)
		song.artist = self unless song.artist == self
	end

	def genres
		self.songs.collect{|s| s.genre}.uniq
	end

	def to_s
    "#{name}"
  end
end