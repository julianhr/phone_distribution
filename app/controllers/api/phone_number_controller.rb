class Api::PhoneNumberController < ApplicationController
  # POST /phone_number/assign_specific
  def assign_specific
    begin
      number = params[:number].split('-')
      area_code = AreaCode.find_by code: number.first.to_i
      number = number[1..2].join('').to_i
      user = User.find_by email: params[:email]
      phone_number = PhoneNumber.where(area_code_id: area_code.id, number: number).first
      phone_number.update!(user_id: user.id)

      render json: { assigned: true }
    rescue => exception
      render json: { assigned: false, error: exception.message }
    end
  end

  # GET /phone_number/:number/availability
  def availability
    begin
      number = params[:number].split('-')
      area_code = AreaCode.find_by code: number.first.to_i
      number = number[1..2].join('').to_i
      phone_number = PhoneNumber.where(area_code_id: area_code.id, number: number).first

      if phone_number
        render json: { available: phone_number.user_id.nil? }
      else
        render json: { available: false }
      end
    rescue => exception
      render json: { available: false, error: exception.message }
    end
  end
end
