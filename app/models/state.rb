class State < ApplicationRecord
  has_many :city

  validates :code, uniqueness: true, length: { is: 2 }
  validates :name, uniqueness: true, presence: true
end
