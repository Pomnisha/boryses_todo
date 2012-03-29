class TasklistsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user
  before_filter :idetify_tasklist, :only => [:edit, :update, :show, :destroy]
  # GET /tasklists/1
  # GET /tasklists/1.json
  def index
    @tasklists = @project.tasklists
  end
  
  def show
  end

  # GET /tasklists/new
  # GET /tasklists/new.json
  def new
    @tasklist = Tasklist.new()
  end

  # GET /tasklists/1/edit
  def edit
  end

  # POST /tasklists
  # POST /tasklists.json
  def create
    @tasklist = Tasklist.new(params[:tasklist])
    if @tasklist.save
      redirect_to project_tasklist_path(@project, @tasklist), :notice => 'Tasklist was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /tasklists/1
  # PUT /tasklists/1.json
  def update
    if @tasklist.update_attributes(params[:tasklist])
      redirect_to project_tasklist_path(@project,@tasklist), notice: 'Tasklist was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /tasklists/1
  # DELETE /tasklists/1.json
  def destroy
    @tasklist.destroy
    redirect_to action: "index"
  end
  
  private

  def correct_user
    begin
      @project = Project.find(params[:project_id])
      @user = current_user
      redirect_to user_path(current_user), notice: 'You are not allowed to access this content.' and return unless @project.nil? or @project.collaborators.include?(current_user)
    rescue
      render template: "projects/new" and return
    end

  end

  def idetify_tasklist
    begin
      @tasklist = Tasklist.find(params[:id])
      redirect_to user_path(current_user), notice: 'Wrong tasklist identifier.' and return unless @project.tasklists.include?(@tasklist)
    rescue
      render action: "new" and return
    end
  end

end

