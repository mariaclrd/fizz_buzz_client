require 'typhoeus'
require 'json'

module FizzBuzzClient
  module NumbersActions
    FIRST_NUMBER = 1
    LAST_NUMBER = 100000000000

    def find_fizz_buzz_for(number)
      numbers = find_numbers(current_page: (number/100 + 1))
      found_number = numbers.find{|element| element["number"] == number}
      found_number["fizz_buzz_value"] if found_number
    end

    def find_numbers(page_size = 100, current_page: 1)
      NumbersClient.index({current_page: current_page, page_size: page_size})
    end

    module_function :find_fizz_buzz_for, :find_numbers
  end
end