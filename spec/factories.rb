FactoryBot.define do

  factory :state do
    code { 'CA' }
    name { 'California' }
  end

  factory :city do
    sequence(:name) { |n| "City #{n}" }
    state
  end

  factory :zip_code do
    sequence(:code, 12345)  { |n| n }
    city
  end

  factory :area_code do
    sequence(:code, 123) { |n| n }
  end

  factory :phone_number do
    sequence(:number, 1000) { |n| 555_0000 + n }
    area_code
  end

  factory :user do
    full_name { 'John Smith' }
    sequence(:email) { |n| "name#{n}@email.com" }
  end

end