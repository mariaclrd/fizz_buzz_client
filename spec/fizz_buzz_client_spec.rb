require 'spec_helper'

describe 'FizzBuzzClient' do
  subject { FizzBuzzClient }

  describe 'fizz_buzz_url' do
    it 'reads from the configuration file' do
      expect(FizzBuzzClient.fizz_buzz_url).to_not be_empty
    end
  end
end