class ZipCode < ApplicationRecord
  belongs_to :city
  has_many :area_code, through: :zip_code_area_codes

  validates :code,
    uniqueness: true,
    numericality: { greater_than: 500, less_than_or_equal_to: 99999 }
  validates :city_id,
    presence: true
end
