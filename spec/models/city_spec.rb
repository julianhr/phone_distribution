require 'rails_helper'

RSpec.describe City, type: :model do
  let(:state) { create(:state) }

  let(:valid_attributes) do
    {
      name: 'San Francisco',
      state_id: state.id,
    }
  end

  it 'is valid if all attributes are correct' do
    city = City.new valid_attributes
    expect(city).to be_valid
  end

  it { should belong_to(:state) }
  it { should have_many(:zip_code) }

  describe '#name' do
    context 'is invalid if' do
      let(:city) { City.new valid_attributes }

      it 'is empty' do
        city.name = nil
        expect(city).to be_invalid
        expect(city.errors[:name]).not_to be_empty
      end
    end
  end

end
