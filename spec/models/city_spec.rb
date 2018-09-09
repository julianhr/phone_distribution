require 'rails_helper'

RSpec.describe City, type: :model do
  let(:state) { create(:state) }

  let(:valid_attributes) do
    {
      name: 'San Francisco',
      state_id: state.id,
    }
  end

  let(:city) { City.new valid_attributes }

  it 'is valid if all attributes are correct' do
    expect(city).to be_valid
  end

  it { should belong_to(:state) }
  it { should have_many(:zip_code) }

  describe '#name' do
    context 'is invalid if' do
      it 'is empty' do
        city.name = nil
        expect(city).to be_invalid
        expect(city.errors[:name]).not_to be_empty
      end
    end
  end

  describe '#state_id' do
    context 'is invalid if' do
      it 'is empty' do
        city.state_id = nil
        expect(city).to be_invalid
        expect(city.errors[:state_id]).not_to be_empty
      end
    end
  end

end
