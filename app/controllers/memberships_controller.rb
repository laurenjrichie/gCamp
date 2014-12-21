class MembershipsController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @membership = @project.memberships.new
  end

end
