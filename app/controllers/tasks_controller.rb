class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user
  before_filter :idetify_task, :only => [:edit, :update, :show, :destroy]

  # GET /tasks/1
  # GET /tasks/1.json
  def index
    if Task::TASK_STATES.include?(params[:state]) then
      @tasks = @tasklist.tasks.where(:tstate => params[:state])
    else
      @tasks = @tasklist.tasks
      render action: "index", :notice => "Wrong state. All tasks are listed."
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    if @task.save
      redirect_to project_tasklist_task_path(@project, @tasklist, @task), notice: 'Task was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    if @task.update_attributes(params[:task])
      redirect_to project_tasklist_task_path(@project, @tasklist, @task), notice: 'Task was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to project_tasklist_path(@project, @tasklist)
  end

  def correct_user
    begin
      @project = Project.find(params[:project_id])
      @tasklist = Tasklist.find(params[:tasklist_id])
      @user = current_user
      redirect_to user_path(current_user), notice: 'You are not allowed to access this content.' and return unless @project.nil? or @project.collaborators.include?(current_user)
      redirect_to user_path(current_user), notice: 'Wrong tasklist identifier.' and return unless @project.tasklists.include?(@tasklist)
    rescue
      redirect_to user_path(current_user), notice: "Wrong project or tasklist identifier." and return
    end
  end

  def idetify_task
    begin
      @task = Task.find(params[:id])
      redirect_to user_path(current_user), notice: 'Wrong task identifier.' and return unless @tasklist.tasks.include?(@task)
    rescue
      render action: "new" and return
    end
  end

end
