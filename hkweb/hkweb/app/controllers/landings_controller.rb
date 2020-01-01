class LandingsController < ApplicationController
  before_action :set_landing, only: [:show, :edit, :update, :destroy]
  before_action :set_groups, only: [:index, :new, :create, :edit, :update]

  # GET /landings
  def index
    @landings = Landing.all
  end

  # GET /landings/1
  def show
  end

  # GET /landings/new
  def new
    group_id = params[:group_id]
    @landing = Landing.new(group_id: group_id)
    console
  end

  # GET /landings/1/edit
  def edit
  end

  # POST /landings
  def create
    @landing = Landing.new(landing_params)
    @landing.group = Group.find_or_initialize_by(name: params[:landing][:group_name]) if params && params[:landing] && params[:landing][:group_name].present?

    if @landing.save
      flash.now[:notice] = "#{@landing.name} was successfully created."
      render :index
    else
      render :new
    end
  end

  # PATCH/PUT /landings/1
  def update
    @landing.assign_attributes(landing_params)
    group = Group.find_or_initialize_by(name: params[:landing][:group_name]) if params && params[:landing] && params[:landing][:group_name].present?

    if @landing.save
      flash.now[:notice] = "#{@landing.name} was successfully updated."
      render :index
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
    def set_groups
      @groups = Group.all
    end

    def set_landing
      @landing = Landing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def landing_params
      params.require(:landing).permit(:name, :url, :group_id)
    end
end
