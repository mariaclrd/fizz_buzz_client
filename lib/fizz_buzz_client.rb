module FizzBuzzClient
  autoload :Cli, 'fizz_buzz_client/cli'
  autoload :NumbersClient, 'fizz_buzz_client/numbers_client'
  autoload :NumbersActions, 'fizz_buzz_client/numbers_actions'
  autoload :FavouriteClient, 'fizz_buzz_client/favourite_client'

  def self.fizz_buzz_url
    @fizz_buzz_url ||= begin
      require 'yaml'
      config = YAML.load_file('config/application.yml')
      config['fizz_buzz_server']['url']
    end
  end
end
