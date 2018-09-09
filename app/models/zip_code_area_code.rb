class ZipCodeAreaCode < ApplicationRecord
  belongs_to :zip_code
  belongs_to :area_code

  validates :area_code_id,
    presence: true,
    uniqueness: { scope: :zip_code_id }
  validates :zip_code_id,
    presence: true
end
