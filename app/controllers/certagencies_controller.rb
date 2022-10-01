class CertagenciesController < ApplicationController
  before_action :set_certagency, only: %i[show edit update destroy]

  # GET /certagencies or /certagencies.json
  def index
    @certagencies = Certagency.all
  end

  # GET /certagencies/1 or /certagencies/1.json
  def show
  end

  # GET /certagencies/new
  def new
    @certagency = Certagency.new
  end

  # GET /certagencies/1/edit
  def edit
  end

  # POST /certagencies or /certagencies.json
  def create
    @certagency = Certagency.new(certagency_params)

    respond_to do |format|
      if @certagency.save
        format.html do
          redirect_to certagency_url(@certagency),
                      notice: "Certagency was successfully created."
        end
        format.json { render :show, status: :created, location: @certagency }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json do
          render json: @certagency.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # PATCH/PUT /certagencies/1 or /certagencies/1.json
  def update
    respond_to do |format|
      if @certagency.update(certagency_params)
        format.html do
          redirect_to certagency_url(@certagency),
                      notice: "Certagency was successfully updated."
        end
        format.json { render :show, status: :ok, location: @certagency }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json do
          render json: @certagency.errors, status: :unprocessable_entity
        end
      end
    end
  end

  # DELETE /certagencies/1 or /certagencies/1.json
  def destroy
    @certagency.destroy

    respond_to do |format|
      format.html do
        redirect_to certagencies_url,
                    notice: "Certagency was successfully destroyed."
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_certagency
    @certagency = Certagency.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def certagency_params
    params.require(:certagency).permit(:cert_agency)
  end
end
