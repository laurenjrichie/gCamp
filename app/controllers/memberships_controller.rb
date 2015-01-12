class MembershipsController < ApplicationController
  before_action do
    @project = Project.find(params[:project_id])
  end

  def index
    @memberships = @project.memberships
    @membership = @project.memberships.new
  end

  def create
    @membership = @project.memberships.new(membership_params)
    if @membership.save
      redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was added successfully"
    else
      render :index
    end
  end

  def update
    @membership = @project.memberships.find(params[:id])
    if @membership.update(membership_params)
      redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was successfully updated"
    else
      render :edit
    end
  end

  def destroy
    @membership = @project.memberships.find(params[:id])
    @membership.destroy
    redirect_to project_memberships_path(@project), notice: "#{@membership.user.full_name} was successfully deleted"
  end

  private
  def membership_params
    params.require(:membership).permit(
      :user_id,
      :project_id,
      :role,
    )
  end

end
