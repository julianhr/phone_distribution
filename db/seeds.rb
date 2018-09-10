require 'csv'


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

file_relative_path = 'seed_data/zip_city_state_areacode.csv'
file_abs_path = "#{File.dirname(__FILE__)}/#{file_relative_path}"
phone_numbers_per_zip_code = 3
count = 0

puts 'Seeding will begin'

CSV.foreach(file_abs_path) do |row|
  if count == 0
    count += 1
    next
  end

  db_state = nil
  db_city = nil
  db_zip_code = nil
  db_area_code = nil

  zip_code, city, state, state_code, area_code = row
  zip_code = zip_code.to_i
  area_code = area_code.to_i

  unless db_state = State.find_by(code: state_code)
    db_state = State.create! code: state_code, name: state
  end

  unless db_city = City.where(name: city, ).first
    db_city = City.create! name: city, state: db_state
  end

  unless db_zip_code = ZipCode.find_by(code: zip_code)
    db_zip_code = ZipCode.create! code: zip_code, city: db_city
  end

  unless db_area_code = AreaCode.find_by(code: area_code)
    db_area_code = AreaCode.create! code: area_code
  end

  unless ZipCodeAreaCode.where(zip_code: db_zip_code, area_code: db_area_code).first
    ZipCodeAreaCode.create! zip_code: db_zip_code, area_code: db_area_code
  end

  phone_number_count = phone_numbers_per_zip_code

  PhoneNumber.transaction do
    while phone_number_count > 0
      number = rand(1010001..9899999)
      unless PhoneNumber.where(area_code: db_area_code, number: number).first
        PhoneNumber.create! number: number, area_code: db_area_code
        phone_number_count -= 1
      end
    end
  end

  count += 1

  if count % 200 == 0
    puts "row #{count} was processed"
  end
end

puts "Seeding is finished"
