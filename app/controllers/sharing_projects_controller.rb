class SharingProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_project

  # GET /sharing_projects
  # GET /sharing_projects.json
  def index
    @sharing_projects = SharingProject.all
  end

  # GET /sharing_projects/new
  # GET /sharing_projects/new.json
  def new
    @sharing_project = @project.sharing_projects.build
  end

  # POST /sharing_projects
  # POST /sharing_projects.json
  def create
    user = User.find_or_initialize_by_email(params[:sharing_project][:user_email].strip)
    redirect_to project_path(@project),
        :notice => "#{user.username} is already invited" and return if @project.collaborators.include? user.id

    user.generate_pwd! and user.save if user.new_record?
    @project.users << user

    redirect_to project_path(@project), :notice => "#{user.username} is invited"
  end

  # DELETE /sharing_projects/1
  # DELETE /sharing_projects/1.json
  def destroy
    @sharing_project = SharingProject.find(params[:id])
    @sharing_project.destroy
    redirect_to current_user, :notice => "Project has been deleted"
  end

  protected
  def get_project
    @project = Project.find_by_id params[:project_id]
  end
end
