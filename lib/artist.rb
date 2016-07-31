class Artist
	attr :name, true

	def initialize(name)
		@name = name
		@@all = []
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
		Artist.new(name).save
		self
	end
end