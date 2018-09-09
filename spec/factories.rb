FactoryBot.define do

  factory :state do
    code { 'CA' }
    name { 'California' }
  end

  factory :city do
    name { 'San Francisco' }
    state
  end

end