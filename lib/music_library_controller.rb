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
      user_input = gets.strip
      display_commands(user_input)
    end
  end

  def artists
    add_borderline
    puts "Artists in the Library"
    add_borderline
    Artist.all.each.with_index(1) do |a, i|
      puts "#{i}. #{a}"
    end
    add_borderline
  end

  def genres
    add_borderline
    puts "Genres in the Library"
    add_borderline
    Genre.all.each.with_index(1) do |g, i|
      puts "#{i}. #{g}"
    end
    add_borderline
  end

  def list_artist
    puts "What artist by name would you like to list songs for?"
    puts ""
    print ">"
      artist_input = gets.strip
      if artist = Artist.find_by_name(artist_input)
        add_borderline
        puts "#{artist}'s Songs".capitalize
        add_borderline
        artist.songs.each do |s|
          puts "#{s}"
        end
        add_borderline
      else
        puts "Invalid Artist!, Type \"list artists\" for a list of available artists"
      end
   end

  def list_genre
    puts "What genre by name would you like to list songs for?"
    print ">"
    genre_input = gets.strip
    if genre = Genre.find_by_name(genre_input)
      add_borderline
      puts "#{genre} Songs".capitalize
      add_borderline
      genre.songs.each do |s|
       puts "#{s}"
      end
      add_borderline
    else
        puts "Invalid Genre!, Type \"list genres\" for a list of available genres"
    end
  end

  def play_song
    puts "What song number would you like to play?"

    print ">"
    song_input = gets.strip
    add_borderline
    puts "Playing #{Song.all[song_input.to_i-1]}"
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
end

def display_commands(user_input)
    case user_input
      when "list songs"
        songs
      when "list artists"
        artists
      when "list genres"
        genres
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "play song"
        play_song
      else
        puts "Please Input a Valid Entry"
      end
  end

def display_help
  puts "Please enter:"
  puts ""
  puts "\"list songs\" to view all songs"
  puts "\"list artists\" to view all artists"
  puts "\"list genres\" to view songs' genres"
  puts "\"play song\" to play a song"
  puts "\"list artist\" to view a particular artist's song"
  puts "\"list genre\" to view a particular genre's song"
  puts "\"exit\" to leave the app"
  puts ""
  print ">"
end

def add_borderline
  puts "-" * 70
  puts "-" * 70
end