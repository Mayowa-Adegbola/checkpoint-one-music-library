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
	end

	def self.create(name)
		new(name).save
	end

	def save
		@@all << self
		self
	end

	def add_song(song)
		@songs.push(song) unless @songs.include?(song)
	end

	def artists
    self.songs.collect{|s| s.artist}.uniq
  end

  def to_s
    "#{name}"
  end
end