require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:area_code) { create(:area_code) }
  let(:user) { create(:user) }
  let(:number) { 1231234 }

  let(:valid_attributes) do
    {
      number: number,
      area_code_id: area_code.id,
    }
  end

  let(:phone_number) { PhoneNumber.new valid_attributes }

  it 'is valid if all attributes are correct' do
    expect(phone_number).to be_valid
  end

  it { should belong_to(:area_code) }

  describe '#number' do
    context 'is invalid if' do
      it 'is empty' do
        phone_number.number = nil
        expect(phone_number).to be_invalid
        expect(phone_number.errors[:number]).not_to be_empty
      end

      it 'is not between 1000000 and 9999999' do
        phone_number.number = 999999
        expect(phone_number).to be_invalid
        expect(phone_number.errors[:number]).not_to be_empty

        phone_number.number = 10000000
        expect(phone_number).to be_invalid
        expect(phone_number.errors[:number]).not_to be_empty
      end
    end
  end
  
  describe '#area_code_id' do
    context 'is invalid if' do
      it 'is empty' do
        phone_number.area_code_id = nil
        expect(phone_number).to be_invalid
        expect(phone_number.errors[:area_code_id]).not_to be_empty
      end
    end
  end

  describe 'composite index [area_code_id, number]' do
    it 'allows same number to belong to two different area codes' do
      zip_code = create(:zip_code)
      area_code1 = AreaCode.create! code: 123
      area_code2 = AreaCode.create! code: 987
      phone_number1 = PhoneNumber.new number: number, area_code: area_code1
      phone_number2 = PhoneNumber.new number: number, area_code: area_code2

      expect(phone_number1).to be_valid
      expect(phone_number2).to be_valid
    end

    it 'an area code cannot duplicate the same number' do
      phone_number1 = PhoneNumber.create! valid_attributes
      phone_number2 = PhoneNumber.new area_code_id: phone_number1.area_code_id, number: number
      expect(phone_number2).to be_invalid
      expect(phone_number2.errors[:number]).not_to be_empty
    end
  end
end
