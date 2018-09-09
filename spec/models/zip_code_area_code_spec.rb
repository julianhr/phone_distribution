require 'rails_helper'

RSpec.describe ZipCodeAreaCode, type: :model do
  let(:area_code) { create(:area_code) }
  let(:zip_code) { create(:zip_code) }

  let(:valid_attributes) do
    {
      area_code_id: area_code.id,
      zip_code_id: zip_code.id,
    }
  end

  let(:zip_code_area_code) { ZipCodeAreaCode.new valid_attributes }

  it 'is valid if all attributes are correct' do
    expect(zip_code_area_code).to be_valid
  end

  it 'is invalid if the area code id is empty' do
    zip_code_area_code.area_code_id = nil
    expect(zip_code_area_code).to be_invalid
    expect(zip_code_area_code.errors[:area_code_id]).not_to be_empty
  end

  it 'is invalid if the zip code id is empty' do
    zip_code_area_code.zip_code_id = nil
    expect(zip_code_area_code).to be_invalid
    expect(zip_code_area_code.errors[:zip_code_id]).not_to be_empty
  end

  it 'shold not allow duplicate rows' do
    zcac1 = zip_code_area_code.save!
    zcac2 = ZipCodeAreaCode.new zip_code_id: zip_code.id, area_code_id: area_code.id
    expect(zcac2).to be_invalid
  end
end
