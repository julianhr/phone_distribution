class AreaCodesController < ApplicationController
  before_action :set_area_code, only: [:show, :edit, :update, :destroy]

  # GET /area_codes
  # GET /area_codes.json
  def index
    @area_codes = AreaCode.all
  end

  # GET /area_codes/1
  # GET /area_codes/1.json
  def show
  end

  # GET /area_codes/new
  def new
    @area_code = AreaCode.new
  end

  # GET /area_codes/1/edit
  def edit
  end

  # POST /area_codes
  # POST /area_codes.json
  def create
    @area_code = AreaCode.new(area_code_params)

    respond_to do |format|
      if @area_code.save
        format.html { redirect_to @area_code, notice: 'Area code was successfully created.' }
        format.json { render :show, status: :created, location: @area_code }
      else
        format.html { render :new }
        format.json { render json: @area_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /area_codes/1
  # PATCH/PUT /area_codes/1.json
  def update
    respond_to do |format|
      if @area_code.update(area_code_params)
        format.html { redirect_to @area_code, notice: 'Area code was successfully updated.' }
        format.json { render :show, status: :ok, location: @area_code }
      else
        format.html { render :edit }
        format.json { render json: @area_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /area_codes/1
  # DELETE /area_codes/1.json
  def destroy
    @area_code.destroy
    respond_to do |format|
      format.html { redirect_to area_codes_url, notice: 'Area code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_area_code
      @area_code = AreaCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def area_code_params
      params.require(:area_code).permit(:code, :zip_code_id)
    end
end
