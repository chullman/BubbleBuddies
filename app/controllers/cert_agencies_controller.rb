class CertAgenciesController < ApplicationController
  before_action :set_cert_agency, only: [:show, :edit, :update, :destroy]

  # GET /cert_agencies
  # GET /cert_agencies.json
  def index
    @cert_agencies = CertAgency.all
  end

  # GET /cert_agencies/1
  # GET /cert_agencies/1.json
  def show
  end

  # GET /cert_agencies/new
  def new
    @cert_agency = CertAgency.new
  end

  # GET /cert_agencies/1/edit
  def edit
  end

  # POST /cert_agencies
  # POST /cert_agencies.json
  def create
    @cert_agency = CertAgency.new(cert_agency_params)

    respond_to do |format|
      if @cert_agency.save
        format.html { redirect_to @cert_agency, notice: 'Cert agency was successfully created.' }
        format.json { render :show, status: :created, location: @cert_agency }
      else
        format.html { render :new }
        format.json { render json: @cert_agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cert_agencies/1
  # PATCH/PUT /cert_agencies/1.json
  def update
    respond_to do |format|
      if @cert_agency.update(cert_agency_params)
        format.html { redirect_to @cert_agency, notice: 'Cert agency was successfully updated.' }
        format.json { render :show, status: :ok, location: @cert_agency }
      else
        format.html { render :edit }
        format.json { render json: @cert_agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cert_agencies/1
  # DELETE /cert_agencies/1.json
  def destroy
    @cert_agency.destroy
    respond_to do |format|
      format.html { redirect_to cert_agencies_url, notice: 'Cert agency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cert_agency
      @cert_agency = CertAgency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cert_agency_params
      params.require(:cert_agency).permit(:cert_agency)
    end
end
