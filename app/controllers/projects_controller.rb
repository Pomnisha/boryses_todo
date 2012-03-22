class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user, :only => [:edit, :update, :destroy, :show]
  # GET /projects
  # GET /projects.json

  # GET /projects/new
  # GET /projects/new.json

  def index
  end

  def show
    @user = current_user
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
    end
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
    respond_to do |format|
      if @project.save
        format.html { redirect_to current_user, notice: 'Project was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to current_user, notice: 'Project was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to current_user, notice: 'Project was successfully deleted.' }
    end
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
