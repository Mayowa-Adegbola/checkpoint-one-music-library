class MusicImporter
	attr_reader :path

	def initialize(path)
		@path = path
	end

	def files
		Dir[File.join(@path, '*.mp3')].map { |filename| File.basename(filename) }
	end

	def import
		files.each { |filename| Song.create_from_filename(filename) }
	end
end
