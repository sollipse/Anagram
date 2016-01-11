require "./anagram_solver.rb"
a = AnagramSolver.new('words.txt')
puts a.solve(ARGV[0])