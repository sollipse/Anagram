# Anagram
A quick anagram solving command line tool built in ruby. 

## Setup
This tool has two main dependencies: ```ruby``` and a ruby gem, ```minitest```. 

[Ruby](https://www.ruby-lang.org/) can be installed fairly easily [using homebrew](https://gorails.com/setup/osx/10.10-yosemite).

After ruby has been installed, installing the minitest gem is as simple as: ```gem install minitest```. 

## Running
This tool can be run from the command line using the following syntax: 

```ruby command_line_solver.rb ANAGRAM_STRING```

### Options
If you wish to use an alternative dictionary than the one provided by this tool, you can specify a file path as the second argument to this tool: 


```ruby command_line_solver.rb ANAGRAM_STRING ALTERNATE_FILEPATH```

## Testing
This tool uses the testing engine and syntax provided by [minitest](https://github.com/seattlerb/minitest).

The tests can be run using the command ```ruby anagram_tester.rb```

Before modifying this code, try to ensure these tests passs. 