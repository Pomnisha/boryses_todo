class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user, :only => [:edit, :update, :destroy, :show]
  # GET /projects
  # GET /projects.json

  # GET /projects/new
  # GET /projects/new.json
  def index
    redirect_to user_path(current_user)
  end
  def show
    @user = current_user
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    render action: "new"
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
    @project.owner = current_user

    if @project.save
      redirect_to @project, notice: 'Project was successfully created.'
    else
      render action: "new"
    end

  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    if @project.update_attributes(params[:project])
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to user_path(current_user), notice: 'Project was successfully deleted.'
  end

  private

  def correct_user
    begin
      @project = Project.find(params[:id])
    rescue
      redirect_to user_path(current_user), notice: "Wrong project identifier."
    ensure
      redirect_to user_path(current_user), notice: 'You are not allowed to access this content.' unless @project.nil? or @project.collaborators.include?(current_user)
    end
  end
end
