class SharingProjectsController < ApplicationController
  before_filter :get_project

  # GET /sharing_projects
  # GET /sharing_projects.json
  def index
    @sharing_projects = SharingProject.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sharing_projects }
    end
  end

  # GET /sharing_projects/new
  # GET /sharing_projects/new.json
  def new
    @sharing_project = @project.sharing_projects.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sharing_project }
    end
  end

  # POST /sharing_projects
  # POST /sharing_projects.json
  def create
    user = User.find_or_initialize_by_email(params[:sharing_project][:user_email].strip)
    redirect_to users_project_path(current_user,:project_id => @project.id),
        :notice => "#{user.username} is already invited" and return if @project.collaborators.include? user.id

    user.generate_pwd! and user.save if user.new_record?
    @project.users << user

    redirect_to users_project_path(current_user,:project_id => @project.id), :notice => "#{user.username} is invited"
  end

  # DELETE /sharing_projects/1
  # DELETE /sharing_projects/1.json
  def destroy
    @sharing_project = SharingProject.find(params[:id])
    @sharing_project.destroy

    respond_to do |format|
      format.html { redirect_to sharing_projects_url }
      format.json { head :ok }
    end
  end


  protected
  def get_project
    @project = Project.find_by_id params[:project_id]
  end
end
