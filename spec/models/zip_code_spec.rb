require 'rails_helper'


RSpec.describe ZipCode, type: :model do
  let(:city) { create(:city) }
  
  let(:valid_attributes) do
    {
      code: 12345,
      city_id: city.id,
    }
  end
  
  let(:zip_code) { ZipCode.new valid_attributes }

  it { should belong_to(:city) }
  it { should have_many(:area_code) }

  describe '#code' do
    it 'is valid if code is 5 integers in length' do
      expect(zip_code).to be_valid
    end

    context 'is invalid if' do
      it 'is not 5 integers in length' do
        zip_code.code = 123
        expect(zip_code).to be_invalid
        expect(zip_code.errors[:code]).not_to be_empty

        zip_code.code = 1235678
        expect(zip_code).to be_invalid
        expect(zip_code.errors[:code]).not_to be_empty
      end

      it 'is not a number between 10000 and 99999' do
        zip_code.code = 00001
        expect(zip_code).to be_invalid
        expect(zip_code.errors[:code]).not_to be_empty

        zip_code.code = 9999
        expect(zip_code).to be_invalid
        expect(zip_code.errors[:code]).not_to be_empty

        zip_code.code = 100000
        expect(zip_code).to be_invalid
        expect(zip_code.errors[:code]).not_to be_empty
      end

      it 'is empty' do
        zip_code.code = nil
        expect(zip_code).to be_invalid
        expect(zip_code.errors[:code]).not_to be_empty
      end

      it 'is not unique' do
        zip_code1 = ZipCode.create valid_attributes
        other_zip_code = ZipCode.new code: zip_code1.code
        expect(other_zip_code).to be_invalid
        expect(other_zip_code.errors[:code]).not_to be_empty
      end
    end
  end

end
