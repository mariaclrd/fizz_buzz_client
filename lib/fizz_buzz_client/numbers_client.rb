require 'typhoeus'
require 'json'

module FizzBuzzClient
  module NumbersClient
    NUMBERS_PATH = '/api/numbers'.freeze

    def self.index(current_page: 1, page_size: 100)
      url = FizzBuzzClient.fizz_buzz_url + NUMBERS_PATH
      response = Typhoeus::Request.new(url, params(current_page, page_size)).run
      JSON.parse(response.body)["entries"] if response.code == 200
    end

    private

    def self.params(current_page, page_size)
      {
          method: :get,
          params: {
              current_page: current_page,
              page_size: page_size,
              format: :json
          }
      }
    end
  end
end