require 'spec_helper'
require 'typhoeus'
require 'json'

describe 'FavouriteClient' do
  subject { FavouriteClient }

  describe 'set' do
    let(:request) { double('request', run: response) }
    let(:response) { double('response', code: 201) }

    before do
      allow(Typhoeus::Request).to receive(:new).and_return(request)
    end

    it 'makes a get request to the FizzBuzz service' do
      expect(Typhoeus::Request).to receive(:new)
        .with('http://localhost:4000/api/favourites',
              method: :post,
              params: { format: :json },
              body: { number: 1 })
      subject.save(number: 1)
    end

    it 'returns true if the request is successful' do
      expect(subject.save(number: 1)).to eq true
    end

    context 'unsuccessful response' do
      let(:response) { double('response', code: 422) }

      it 'returns true if the request is successful' do
        expect(subject.save(number: 1)).to eq false
      end
    end
  end
end
