require 'diary_entry'

RSpec.describe DiaryEntry do
  it 'constructs' do
    diary_entry = DiaryEntry.new("title", "this is the contents")
    expect(diary_entry.title).to eq "title"
    expect(diary_entry.contents).to eq "this is the contents"
  end

  describe '#count_words' do
    it 'returns the number of words in the contents' do
      diary_entry = DiaryEntry.new("title", "this is the contents")
      result = diary_entry.count_words
      expect(result).to eq  4
    end
  end

  describe '#reading_time' do
    context 'given a wpm of something sensible (200)' do
      it 'returned the ceiling of the number of minutes it takes to read' do
        diary_entry = DiaryEntry.new("title", ("hello " * 550))
        expect(diary_entry.reading_time(200)).to eq 3
      end
    end  

    context 'given a wpm of 0' do
      it 'fails' do
        diary_entry = DiaryEntry.new("title", ("one two three"))
        expect { diary_entry.reading_time(0) }.to raise_error "Reading speed must be above 0"
      end
    end
  end

  describe "#reading_chunk" do
    context "with a text readable within the given minutes" do
      it "returns the full contents" do
        diary_entry = DiaryEntry.new("title", ("one two three"))
        chunk = diary_entry.reading_chunk(200, 1)
        expect(chunk).to eq "one two three"
      end
    end

    context "with a contents unreadable within the time" do
      it "returns a readable chunk" do
        diary_entry = DiaryEntry.new("title", ("one two three"))
        chunk = diary_entry.reading_chunk(2, 1)
        expect(chunk).to eq "one two"
      end
    end

    context 'given a wpm of 0' do
      it 'fails' do
        diary_entry = DiaryEntry.new("title", ("one two three"))
        expect { diary_entry.reading_chunk(0, 5) }.to raise_error "Reading speed must be above 0"
      end
    end

    it "returns the next chunk next time we are asked" do
      diary_entry = DiaryEntry.new("title", ("one two three"))
      diary_entry.reading_chunk(2, 1)
      chunk = diary_entry.reading_chunk(2, 1)
      expect(chunk).to eq "three"
    end

    it "restarts after reading all of the contents" do
      diary_entry = DiaryEntry.new("title", ("one two three"))
      diary_entry.reading_chunk(2, 1)
      diary_entry.reading_chunk(2, 1)
      chunk = diary_entry.reading_chunk(2, 1)
      expect(chunk).to eq "one two"
    end

    it "restarts if it finishes exactly on the end" do
      diary_entry = DiaryEntry.new("title", ("one two three"))
      diary_entry.reading_chunk(2, 1)
      diary_entry.reading_chunk(1, 1)
      chunk = diary_entry.reading_chunk(2, 1)
      expect(chunk).to eq "one two"
    end
  end
end