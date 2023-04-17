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

  describe "#percentage_good method" do
    it "returns 100 when all checks have passed" do
      grammar_stats = GrammarStats.new
      grammar_stats.check("Hello, my name is Alice.")
      grammar_stats.check("Hello, my name is Alice!")
      expect(grammar_stats.percentage_good).to eq 100
    end
  end

    it "returns 0 when none of the checks have passed" do
      grammar_stats = GrammarStats.new
      grammar_stats.check("Hello, my name is Alice")
      grammar_stats.check("hello, my name is Alice!")
      expect(grammar_stats.percentage_good).to eq 0
    end

    it "returns 50 when none of the checks have passed" do
      grammar_stats = GrammarStats.new
      grammar_stats.check("Hello, my name is Alice.")
      grammar_stats.check("hello, my name is Alice!")
      expect(grammar_stats.percentage_good).to eq 50
    end

    it "returns 55 when 11 out of 20 checks have been passed" do
      grammar_stats = GrammarStats.new
      grammar_stats.check("Hello, my name is Alice.")
      grammar_stats.check("Hello, my name is Alice.")
      grammar_stats.check("Hello, my name is Alice.")
      grammar_stats.check("Hello, my name is Alice.")
      grammar_stats.check("Hello, my name is Alice.")
      grammar_stats.check("Hello, my name is Alice.")
      grammar_stats.check("Hello, my name is Alice.")
      grammar_stats.check("Hello, my name is Alice.")
      grammar_stats.check("Hello, my name is Alice.")
      grammar_stats.check("Hello, my name is Alice.")
      grammar_stats.check("Hello, my name is Alice.")
      grammar_stats.check("hello, my name is Alice!")
      grammar_stats.check("hello, my name is Alice!")
      grammar_stats.check("hello, my name is Alice!")
      grammar_stats.check("hello, my name is Alice!")
      grammar_stats.check("hello, my name is Alice!")
      grammar_stats.check("hello, my name is Alice!")
      grammar_stats.check("hello, my name is Alice!")
      grammar_stats.check("hello, my name is Alice!")
      grammar_stats.check("hello, my name is Alice!")
      expect(grammar_stats.percentage_good).to eq 55
    end
end

# TESTS
# check("") => false
# check("Hello.") => true
# check("Hello") => false
# check("hello.") => false
# check("Hello!") => true
# check("Hello?") => true

# percentage good tests
#  100 percent checked
#  0 percent checked
#  50 percent checked
