class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    user_input = ""
    add_borderline
    puts "Welcome to Your Music Library!"
    add_borderline
    while user_input != "exit"
      display_help
      print ">"
      user_input = gets.strip
      process_input(user_input)
    end
  end

  def process_input(user_input)
    if commands[user_input]
      send(commands[user_input])
    else
      puts "Invalid Entry!"
    end
  end

  def artists
    add_borderline
    puts "Artists in the Library"
    add_borderline
    Artist.all.each do |i|
      puts "#{i}"
    end
    add_borderline
  end

  def genres
    add_borderline
    puts "Genres in the Library"
    add_borderline
    Genre.all.each.with_index(1) do |g|
      puts "#{g}"
    end
    add_borderline
  end

  def songs
    add_borderline
    puts "Songs in the Library"
    add_borderline
    Song.all.each.with_index(1) do |s, i|
      puts "#{i}. #{s}"
    end
    add_borderline
  end

  def list_artist
    puts "What artist by name would you like to list songs for?"
    print ">"
    artist_input = gets.strip
    artist = Artist.find_by_name(artist_input)
    list(artist)
  end

  def list_genre
    puts "What genre by name would you like to list songs for?"
    print ">"
    genre_input = gets.strip
    genre = Genre.find_by_name(genre_input)
    list(genre)
  end

  def play_song
    puts "What song number would you like to play?"
    print ">"
    song_input = gets.strip.to_i
    if song_input > 1 || song_input < Song.all.size
      add_borderline
      puts "Playing #{Song.all[song_input.to_i-1]}"
      add_borderline
    else
      puts "Invalid Song!, Type \"list songs\" for a list of available songs"
    end
  end

  def list(category)
    if category
      puts "#{category}'s Songs".capitalize
        add_borderline
      category.songs.each do |s|
        puts "#{s}"
      end
      add_borderline
    else
      puts "Invalid selection! Check the list of available commands"
    end
  end

  def commands
    {
      "list songs" => :songs,
      "list artists" => :artists,
      "list genres" => :genres,
      "play song" => :play_song,
      "list artist" => :list_artist,
      "list genre" => :list_genre,
    }
  end

  def display_help
    puts <<-HELP_MENU
    Please Enter:
    "list songs" to view all songs
    "list artists" to view all artists
    "list genres" to view songs\s genres
    "play song" to play a song
    "list artist" to view a particular artist\'s song
    "list genre" to view a particular genre\'s song
    "exit" to leave the app
    HELP_MENU
  end

  def add_borderline
    puts "-" * 70
    puts "-" * 70
  end
end
