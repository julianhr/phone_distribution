class AreaCode < ApplicationRecord
  has_many :phone_numbers
  has_many :zip_codes, through: :zip_code_area_codes

  validates :code,
    uniqueness: true,
    numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 999 }
end
