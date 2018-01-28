require 'mini_cli'

module FizzBuzzClient
  class Cli < MiniCli::Base
    desc 'console', 'Runs the console with Pry'
    def console
      require 'pry'

      Pry.start self
    end

    desc 'test', 'Runs the tests all the application'
    def test(options = {})
      require 'rspec'
      ret = RSpec::Core::Runner.run(['spec/'])
      exit ret.to_i
    end

    desc 'numbers', 'List of numbers and their fizzbuzz value. By default this list has 100 items. You can pass another number'
    def numbers(page_size=100)
      page_size = page_size.to_i
      return puts "You need to pass a number greater than 0" unless page_size > 0

      if numbers =NumbersActions.find_numbers(page_size: page_size)
        puts 'List of numbers: '
        numbers.each do |number|
          puts 'Number: ' + number["number"].to_s + ", FizzBuzz: " + number["fizz_buzz_value"].to_s
        end
      else
        puts "There was an error processing your request"
      end
    end

    desc 'favourite', 'Allows to store your favourite number on the collection, requires a number'
    def favourite(number=nil)
      number = number.to_i
      return puts "You need to pass a number greater than 0" unless !number.nil? && number > 0

      success = FavouriteClient.save(number: number)

      if success
        puts "Your number #{number} has been successfully saved as favourite"
      else
        puts "Your number couldn't been set as favourite"
      end
    end

    desc 'fizz_buzz_for', 'It returns the fizzbuzz value for a number. Requires a number'
    def fizz_buzz_for(number)
      number = number.to_i
      return puts "You need to pass a number greater than 0" unless !number.nil? && number > 0

      fizz_buzz_value = NumbersActions.find_fizz_buzz_for(number)
      puts "#{number} is #{fizz_buzz_value}"
    end
  end
end

