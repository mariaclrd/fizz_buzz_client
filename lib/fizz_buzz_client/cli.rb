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

    desc 'numbers', 'Request the numbers to the fizzbuzz application'
    def numbers(options = {})
      current_page = options[:current_page] || 1
      page_size = options[:page_size] || 100
      numbers = NumbersClient.index(current_page: current_page, page_size: page_size)
      if numbers
        puts 'Available numbers: '
        numbers.each do |number|
          puts 'Number: ' + number["number"].to_s + ", FizzBuzz: " + number["fizz_buzz_value"].to_s
        end
      else
        puts "There was an error processin your request"
      end
    end

    desc 'favourite', 'Allows to store your favourite nubmer on the collection'
    def favourite(options = {})
      return puts "You need to pass a number" if options.empty?

      success = FavouriteClient.save(options[:number])

      if success
        puts "Your number has been successfuly saved as favourite"
      else
        puts "Your number couldn't been set as favourite"
      end
    end
  end
end

