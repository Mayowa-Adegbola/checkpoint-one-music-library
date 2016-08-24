class Info

  def self.display_help
    puts <<-HELP_MENU
    Please Enter:
    "list songs" to view all songs
    "list artists" to view all artists
    "list genres" to view songs\'s genres
    "play song" to play a song
    "list artist" to view a particular artist\'s song
    "list genre" to view a particular genre\'s song
    "exit" to leave the app
    HELP_MENU
  end

  def self.greetings
    puts "-".colorize(:red) * 70
    puts "-".colorize(:red) * 70
    puts "Welcome to Your Music Library!".colorize(:green)
    puts "-".colorize(:red) * 70
    puts "-".colorize(:red) * 70

  end
end