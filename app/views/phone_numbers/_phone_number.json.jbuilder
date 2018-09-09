json.extract! phone_number, :id, :number, :area_code_id, :user_id, :created_at, :updated_at
json.url phone_number_url(phone_number, format: :json)
