class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :destroy]

  # GET /landings/1/edit
  def edit
  end

  # PATCH/PUT /landings/1
  def update
    @group.assign_attributes(group_params)
    if @group.save
      redirect_to landings_url, notice: "Group ##{@group.id} '#{@group.name}' was successfully updated."
    else
      redirect_to landings_url, notice: "Group failed to update."
    end
  end

  # DELETE /landings/1
  def destroy
    @group.destroy
    redirect_to landings_url, notice: "Group ##{@group.id} '#{@group.name}' was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_group
      @group = Group.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def group_params
      params.require(:group).permit(:name)
    end
end
