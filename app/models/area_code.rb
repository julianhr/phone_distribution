class AreaCode < ApplicationRecord
  belongs_to :zip_code
  has_many :phone_number

  validates :code,
    uniqueness: true,
    numericality: { greater_than_or_equal_to: 100, less_than_or_equal_to: 999 }
end
