require "diary"

RSpec.describe "Diary" do
  it "it creates" do
    diary = Diary.new
    expect(diary.all).to eq []
  end

  
end