class Api::UsersController < ApplicationController
  # GET /api/show?params
  def show
    user = User.find_by(email: params[:email]) || {}
    render json: user
  end
end
