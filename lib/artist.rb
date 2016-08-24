class Artist < Base

  @@all = []

  def add_song(song)
    @songs << song unless @songs.include?(song)
    song.artist ||= self
  end

  def genres
    self.songs.collect{|s| s.genre}.uniq
  end
end