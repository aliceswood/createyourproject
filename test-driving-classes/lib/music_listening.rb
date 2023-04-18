class MusicTracker
  def initialize
    @list = []
  end

  def view
    return @list.uniq
  end

  def add(song)
    fail "Please state a song to add!" if song.empty?

    @list << song
  end
end


