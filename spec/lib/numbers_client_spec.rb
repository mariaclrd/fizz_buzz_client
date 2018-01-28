require 'spec_helper'
require 'typhoeus'
require 'json'

describe 'NumbersClient' do
  subject { NumbersClient }

  describe 'index' do
    let(:request) { double('request', run: response) }
    let(:response) { double('response', code: 200, body: numbers.to_json) }

    let(:numbers) do
      {
        'pagination' => { 'current_page' => 1, 'total_pages' => 50, 'total_entries' => 100 },
        'entries' =>
              [
                { 'number' => 1,
                  'fizz_buzz_value' => 1,
                  'favourite' => false }, { 'number' => 2,
                                            'fizz_buzz_value' => 2,
                                            'favourite' => false }
              ]
      }
    end

    before do
      allow(Typhoeus::Request).to receive(:new).and_return(request)
    end

    it 'makes a get request to the FizzBuzz service' do
      expect(Typhoeus::Request).to receive(:new)
        .with('http://localhost:4000/api/numbers',
              method: :get,
              params: { current_page: 1, page_size: 2, format: :json })
      subject.index(current_page: 1, page_size: 2)
    end

    it 'returns the parsed response' do
      expect(subject.index).to eq numbers['entries']
    end

    context 'unsuccessful response' do
      let(:response) { double('response', code: 422) }

      it 'returns true if the request is successful' do
        expect(subject.index).to be_nil
      end
    end
  end
end
