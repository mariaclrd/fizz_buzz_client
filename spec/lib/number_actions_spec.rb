require "spec_helper"

describe "NumbersClient" do
  subject { NumbersActions }

  describe "find_favourites" do
    let(:numbers) {[
        { 'number' => 1,
          'fizz_buzz_value' => 1,
          'favourite' => false
        }, { 'number' => 3,
             'fizz_buzz_value' => 'Fizz',
             'favourite' => false
        }
    ]}

    before do
      allow(NumbersClient).to receive(:index).and_return(numbers)
    end

    it 'makes a request with the correct page' do
      expect(NumbersClient).to receive(:index).with({current_page: 2, page_size: 100})
      subject.find_fizz_buzz_for(150)
    end

    it 'returns the fizz buzz value' do
      expect(subject.find_fizz_buzz_for(3)).to eq 'Fizz'
    end
  end
end