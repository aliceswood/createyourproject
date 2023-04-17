require 'grammarstats'

RSpec.describe "check method" do
  context "when passed an empty string" do
    it "fails" do
      grammar_stats = GrammarStats.new
      expect { grammar_stats.check("") }.to raise_error "Please enter a string to check"
    end
  end

  context "when passed a string starting with capital and ending with a full stop" do
    it "returns true" do
      grammar_stats = GrammarStats.new
      expect(grammar_stats.check("Hello.")).to eq true
    end
  end

  context "when passed a string starting with capital and but does not have a full stop" do
    it "returns false" do
      grammar_stats = GrammarStats.new
      expect(grammar_stats.check("Hello")).to eq false
    end
  end

  context "when passed a string not starting with capital and but does have a full stop" do
    it "returns false" do
      grammar_stats = GrammarStats.new
      expect(grammar_stats.check("hello.")).to eq false
    end
  end

  context "when passed a string starting with capital and ending with a exclamation point" do
    it "returns true" do
      grammar_stats = GrammarStats.new
      expect(grammar_stats.check("Hello!")).to eq true
    end
  end

  context "when passed a string starting with capital and ending with a question mark" do
    it "returns true" do
      grammar_stats = GrammarStats.new
      expect(grammar_stats.check("Hello?")).to eq true
    end
  end
end

# TESTs
# check("") => false
# check("Hello.") => true
# check("Hello") => false
# check("hello.") => false
# check("Hello!") => true
# check("Hello?") => true