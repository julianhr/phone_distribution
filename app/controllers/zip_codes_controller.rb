class ZipCodesController < ApplicationController
  before_action :set_zip_code, only: [:show, :edit, :update, :destroy]

  # GET /zip_codes
  # GET /zip_codes.json
  def index
    @zip_codes = ZipCode.all
  end

  # GET /zip_codes/1
  # GET /zip_codes/1.json
  def show
  end

  # GET /zip_codes/new
  def new
    @zip_code = ZipCode.new
  end

  # GET /zip_codes/1/edit
  def edit
  end

  # POST /zip_codes
  # POST /zip_codes.json
  def create
    @zip_code = ZipCode.new(zip_code_params)

    respond_to do |format|
      if @zip_code.save
        format.html { redirect_to @zip_code, notice: 'Zip code was successfully created.' }
        format.json { render :show, status: :created, location: @zip_code }
      else
        format.html { render :new }
        format.json { render json: @zip_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /zip_codes/1
  # PATCH/PUT /zip_codes/1.json
  def update
    respond_to do |format|
      if @zip_code.update(zip_code_params)
        format.html { redirect_to @zip_code, notice: 'Zip code was successfully updated.' }
        format.json { render :show, status: :ok, location: @zip_code }
      else
        format.html { render :edit }
        format.json { render json: @zip_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zip_codes/1
  # DELETE /zip_codes/1.json
  def destroy
    @zip_code.destroy
    respond_to do |format|
      format.html { redirect_to zip_codes_url, notice: 'Zip code was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_zip_code
      @zip_code = ZipCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def zip_code_params
      params.require(:zip_code).permit(:code, :city_id)
    end
end
