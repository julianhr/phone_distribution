FactoryBot.define do

  factory :state do
    code { 'CA' }
    name { 'California' }
  end

  factory :city do
    name { 'San Francisco' }
    state
  end

  factory :zip_code do
    code { 12345 }
    city
  end

end