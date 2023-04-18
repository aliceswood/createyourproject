require 'music_listening'

RSpec.describe MusicTracker do
  it "creates" do
    music_tracker = MusicTracker.new
  end

  context "when no songs have been submitted" do
    it "returns an empty list" do
      music_tracker = MusicTracker.new
      expect(music_tracker.view).to eq []
    end
  end

  context "when a song is added" do
    it "pushes to the list" do
      music_tracker = MusicTracker.new
      music_tracker.add("Across the Room - Odesza")
      expect(music_tracker.view).to eq ["Across the Room - Odesza"]
    end
  end  

  context "when we try to add a song but string is empty" do
    it "fails" do
      music_tracker = MusicTracker.new
      expect { music_tracker.add("") }.to raise_error "Please state a song to add!"
    end
  end

  context "when passed multiple songs" do
    it "adds multiple songs to the list" do
      music_tracker = MusicTracker.new
      music_tracker.add("Across the Room - Odesza")
      music_tracker.add("Home - Ben Bohmer")
      expect(music_tracker.view).to eq ["Across the Room - Odesza", "Home - Ben Bohmer"]
    end
  end

  context "when there are duplicate songs on the list" do
    it "returns unique songs only" do
      music_tracker = MusicTracker.new
      music_tracker.add("Across the Room - Odesza")
      music_tracker.add("Across the Room - Odesza")
      expect(music_tracker.view).to eq ["Across the Room - Odesza"]
    end
  end
end