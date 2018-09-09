class ZipCode < ApplicationRecord
  belongs_to :city
  has_many :area_code

  validates :code,
    uniqueness: true,
    numericality: { greater_than_or_equal_to: 10000, less_than_or_equal_to: 99999 }
  validates :city_id,
    presence: true
end
