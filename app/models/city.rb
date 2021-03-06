class City < ApplicationRecord
  belongs_to :state
  has_many :zip_code

  validates :name,
    presence: true
  validates :state_id,
    presence: true
end
