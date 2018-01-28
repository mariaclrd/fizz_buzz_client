require 'typhoeus'
require 'json'

module FizzBuzzClient
  module FavouriteClient
    FAVOURITES_PATH = '/api/favourites'.freeze

    def self.save(number:)
      url = FizzBuzzClient.fizz_buzz_url + FAVOURITES_PATH
      response = Typhoeus::Request.new(url, params(number)).run
      response.code == 201
    end

    private

    def self.params(number)
      {
          method: :post,
          params: {format: :json},
          body: {number: number}
      }
    end
  end
end