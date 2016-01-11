$VERBOSE = nil
gem "minitest"
require "minitest/autorun"
require "./anagram_solver.rb"


describe AnagramSolver do
  
  def setup
    @@as ||= AnagramSolver.new("words.txt")
  end
  
  describe 'Sanitary input' do 
    
    it "correctly solves for the multi-anagram example value" do 
      assert_equal %w[earth hater heart herat rathe], @@as.solve("earth")
    end

    it "correctly identifies non-anagrammatic input" do
      assert_equal nil, @@as.solve("aaaaaaaaa")
    end
  end

  describe "Unsanitary  input" do
    it "correctly identifies when it has been given a non-existent, non-anagrammatic string" do
      assert_equal ["provincial"], @@as.solve("provincial")
    end

    it "sanitizes dirty input and returns valid anagrams from them" do
      assert_equal %w[earth hater heart herat rathe], @@as.solve("ea1 rt 22h")
    end
  end
end