class Genre < Base

  @@all = []

  def artists
    self.songs.collect{|s| s.artist}.uniq
  end
end