require 'make_snippet'

RSpec.describe 'make_snippet method' do
  context "given an empty string" do
    it "fails when given an empty string" do
      expect { make_snippet("")}.to raise_error "the string is empty."
    end
  end

  context "given a string of 5 words"  do
    it "returns the string of 5 words " do
      result = make_snippet("Hello my name is Alice")
      expect(result).to eq "Hello my name is Alice" 
    end
  end

  context "given a string of more than 5 words" do
    it "returns the first 5 words and then ..." do
      result = make_snippet("Hello my name is Alice - what is your name?")
      expect(result).to eq "Hello my name is Alice ..."
    end  
  end
end