class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    Info.greetings
    loop do
      Info.display_help
      user_input = gets.strip.downcase
      break if user_input == "exit"
      process_input(user_input)
    end
  end

  def process_input(user_input)
    if commands[user_input]
      send(commands[user_input])
    else
      puts "Invalid Input! Check that you have entered the right command".colorize(:red)
    end
  end

  def artists
    puts "Artists in the Library".colorize(:blue)
    Artist.all.each do |i|
      puts "#{i.name}"
    end
  end

  def genres
    puts "Genres in the Library".colorize(:blue)
    Genre.all.each.with_index(1) do |g|
      puts "#{g.name}"
    end
  end

  def songs
    puts "Songs in the Library".colorize(:blue)
    Song.all.each.with_index(1) do |s, i|
      puts "#{i}. #{s}"
    end
  end

  def list_artist
    puts "What artist by name would you like to list songs for?".colorize(:blue)
    artist_input = gets.strip
    artist = Artist.find_by_name(artist_input)
    list(artist)
  end

  def list_genre
    puts "What genre by name would you like to list songs for?".colorize(:blue)
    genre_input = gets.strip.downcase
    genre = Genre.find_by_name(genre_input)
    list(genre)
  end

  def play_song
    puts "What song number would you like to play?"
    song_input = gets.strip.to_i
    if song_input > 0 && song_input <= Song.all.size
      puts "Playing #{Song.all[song_input.to_i-1]}"
    else
      puts "Invalid Song!, Type \"list songs\" for a list of available songs"
    end
  end

  def list(category)
    if category
      puts "#{category.name} Songs".capitalize
      category.songs.each do |s|
        puts "#{s}"
      end
    else
      puts "Invalid selection! Check the list of available commands".colorize(:red)
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
end
