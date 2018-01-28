require 'typhoeus'
require 'json'

module FizzBuzzClient
  module FavouriteClient
    FIZZ_BUZZ_URL = 'http://localhost:4000/api/favourites'.freeze

    def self.save(number:)
      response = Typhoeus::Request.new(FIZZ_BUZZ_URL, params(number)).run
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