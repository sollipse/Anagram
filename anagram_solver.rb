class AnagramSolver

  # On class instantiation, load the dictionary.txt file into memory and construct
  # a dictionary hash of 
  # KEY: frequency map
  # VALUE: line number in file 
  def initialize(dictionary_file_path)

    # Set dictionary file path as a class variable, so later lookups can access it.
    @@dictionary_file_path = dictionary_file_path
    @@frequency_dictionary = {}
    
    # Some quality-of-life command-line text so users know that the program hasn't hung. 
    puts "AnagramSolver is now initializing from a large dictionary of data."
    puts "Please stand by while this process takes place.\n"
    print "\|"

    # Grep the file by line. 
    dictionary_size = File.foreach(dictionary_file_path).count
    File.foreach(dictionary_file_path).with_index do |line_data, line_number|
      
      # For each line (equivalent to each word), construct a frequency map.
      # Increment key-values by recording the line numbers where equivalent maps occur. 
      frequency_map = extract_frequency_map(line_data)     
      if @@frequency_dictionary[frequency_map].nil?
        @@frequency_dictionary[frequency_map] = [line_number]
      else
        @@frequency_dictionary[frequency_map] = @@frequency_dictionary[frequency_map] + [line_number]
      end

      # Slowly incrementing progress dots on the command-line.
      if line_number% 10000 == 0
        print "."
      end
    end

    print "\|\n"
  end

  # Class method that takes advantage of pre-initialized dictionary to perform
  # constant-time lookups. 
  def solve(string)
    target_frequency_map = extract_frequency_map(string)
    # Grab an array of line numbers from our frequency map.
    matching_line_numbers = @@frequency_dictionary[target_frequency_map]
    
    # If the input matches no words.
    if !matching_line_numbers
      puts "\nYou have entered a word that does not exist."
      return nil
    else

      matching_words = lookup_line_numbers(matching_line_numbers)
      
      # If the given word is legitimate, but has no anagrams. 
      if matching_words.size == 1 && matching_words.include?(string)
        puts "\n#{string} has no anagrams."
      
      # If the given input string has 1 or more anagrams: 
      else
        composed_string = ""
        for word in matching_words
          composed_string += word + "\n"
        end
        puts "\nThe anagrams for #{string} are as follows:"
      end
      return matching_words
    end
  end

  private

  # Converts strings into frequency maps.
  # Returns a hash of
  # KEY: char
  # VALUE: number of occurrences
  def extract_frequency_map(string)
    string = sanitize_string(string)
    f_map = Hash.new(0)
    string.split('').each do |char|
      f_map[char] += 1
    end
    return f_map
  end

  # Snippet method that allows us to convert space-efficient line numbers
  # to the longer string values they represent in the dictionary file. 
  def lookup_line_numbers(line_numbers_array)
    matching_words = []
    for line_number in line_numbers_array
      word = IO.readlines(@@dictionary_file_path)[line_number]
      matching_words.push(sanitize_string(word))
    end
    return matching_words
  end

  def sanitize_string(string)
    # Force string to lowercase
    string = string.downcase
    # Delete spaces and non alphanumerica chars. 
    string = string.gsub(/[^a-z]/i, '')
    return string
  end
end