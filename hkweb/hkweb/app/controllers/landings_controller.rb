class LandingsController < ApplicationController
  before_action :set_landing, only: [:show, :edit, :update, :destroy]

  # GET /landings
  def index
    @landings = Landing.all
  end

  # GET /landings/1
  def show
  end

  # GET /landings/new
  def new
    @landing = Landing.new
  end

  # GET /landings/1/edit
  def edit
  end

  # POST /landings
  def create
    @landing = Landing.new(landing_params)

    if @landing.save
      redirect_to @landing, notice: 'Landing was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /landings/1
  def update
    if @landing.update(landing_params)
      redirect_to @landing, notice: 'Landing was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /landings/1
  def destroy
    @landing.destroy
    redirect_to landings_url, notice: 'Landing was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landing
      @landing = Landing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def landing_params
      params.require(:landing).permit(:name, :url, :group)
    end
end
