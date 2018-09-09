class PhoneNumber < ApplicationRecord
  belongs_to :area_code

  validates :number,
    uniqueness: { scope: :area_code_id },
    numericality: { greater_than_or_equal_to: 1000000, less_than_or_equal_to: 9999999 }
  validates :area_code_id,
    presence: true
end
