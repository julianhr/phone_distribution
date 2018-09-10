class User < ApplicationRecord
  has_many :phone_numbers

  validates :full_name,
    length: { minimum: 2 }
  validates :email,
    uniqueness: true,
    format: { with: URI::MailTo::EMAIL_REGEXP }
end
