require "./anagram_solver.rb"

if ARGV[1]
  a = AnagramSolver.new(ARGV[1])
else
  a = AnagramSolver.new("words.txt")
end

puts a.solve(ARGV[0])