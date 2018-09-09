class Api::ZipCodeController < ApplicationController
  # GET /api/zip_code/random_numbers
  def random_numbers
    zip_code = ZipCode.find_by(code: params[:code])
    area_code_ids = ZipCodeAreaCode.where(zip_code: zip_code).pluck(:area_code_id)
    phone_numbers = PhoneNumber.where(area_code_id: area_code_ids).sample(9)
    trans = phone_numbers.map { |r| "#{r.area_code.code}-#{r.number.to_s[0..2]}-#{r.number.to_s[3..-1]}" }
    render json: trans
  end
end
