class User < ApplicationRecord
  validates :full_name,
    length: { minimum: 2 }
  validates :email,
    uniqueness: true,
    format: { with: URI::MailTo::EMAIL_REGEXP }
end
