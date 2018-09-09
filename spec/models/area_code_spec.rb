require 'rails_helper'

RSpec.describe AreaCode, type: :model do
  let(:zip_code) { create(:zip_code) }

  let(:valid_attributes) do
    {
      code: 123,
      zip_code_id: zip_code.id,
    }
  end

  let(:area_code) { AreaCode.new valid_attributes }

  it 'is valid if all attributes are correct' do
    expect(zip_code).to be_valid
  end

  it { should belong_to(:zip_code) }

  describe '#code' do
    context 'is invalid if' do
      it 'is empty' do
        area_code.code = nil
        expect(area_code).to be_invalid
        expect(area_code.errors[:code]).not_to be_empty
      end

      it 'is not between 100 and 999' do
        area_code.code = 99
        expect(area_code).to be_invalid
        expect(area_code.errors[:code]).not_to be_empty

        area_code.code = 1000
        expect(area_code).to be_invalid
        expect(area_code.errors[:code]).not_to be_empty
      end
    end
  end

  describe '#zip_code_id' do
    context 'is invalid if' do
      it 'is empty' do
        area_code.zip_code_id = nil
        expect(area_code).to be_invalid
        expect(area_code.errors[:zip_code_id]).not_to be_empty
      end
    end
  end

end
