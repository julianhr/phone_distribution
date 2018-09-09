class ZipCodeAreaCodesController < ApplicationController
  before_action :set_zip_code_area_code, only: [:show, :edit, :update, :destroy]

  # GET /zip_code_area_codes
  # GET /zip_code_area_codes.json
  def index
    @zip_code_area_codes = ZipCodeAreaCode.all
  end

  # GET /zip_code_area_codes/1
  # GET /zip_code_area_codes/1.json
  def show
  end

  # GET /zip_code_area_codes/new
  def new
    @zip_code_area_code = ZipCodeAreaCode.new
  end

  # GET /zip_code_area_codes/1/edit
  def edit
  end

  # POST /zip_code_area_codes
  # POST /zip_code_area_codes.json
  def create
    @zip_code_area_code = ZipCodeAreaCode.new(zip_code_area_code_params)

    respond_to do |format|
      if @zip_code_area_code.save
        format.html { redirect_to @zip_code_area_code, notice: 'Zip code area code was successfully created.' }
        format.json { render :show, status: :created, location: @zip_code_area_code }
      else
        format.html { render :new }
        format.json { render json: @zip_code_area_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zip_code_area_codes/1
  # PATCH/PUT /zip_code_area_codes/1.json
  def update
    respond_to do |format|
      if @zip_code_area_code.update(zip_code_area_code_params)
        format.html { redirect_to @zip_code_area_code, notice: 'Zip code area code was successfully updated.' }
        format.json { render :show, status: :ok, location: @zip_code_area_code }
      else
        format.html { render :edit }
        format.json { render json: @zip_code_area_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zip_code_area_codes/1
  # DELETE /zip_code_area_codes/1.json
  def destroy
    @zip_code_area_code.destroy
    respond_to do |format|
      format.html { redirect_to zip_code_area_codes_url, notice: 'Zip code area code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zip_code_area_code
      @zip_code_area_code = ZipCodeAreaCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zip_code_area_code_params
      params.require(:zip_code_area_code).permit(:zip_code_id, :area_code_id)
    end
end
