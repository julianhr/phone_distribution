class User < ApplicationRecord
  validates :full_name,
    length: { minimum: 2 }
  validates :email,
    format: { with: URI::MailTo::EMAIL_REGEXP }
end
