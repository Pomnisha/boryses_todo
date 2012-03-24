class TasklistsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user

  # GET /tasklists/1
  # GET /tasklists/1.json
  def index
    render action: "index"
  end
  
  def show
    @tasklist = Tasklist.find(params[:id])
     render action: "show"
  end

  # GET /tasklists/new
  # GET /tasklists/new.json
  def new
    @tasklist = Tasklist.new()
    render action: "new"
  end

  # GET /tasklists/1/edit
  def edit
    @tasklist = Tasklist.find(params[:id])
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
    @tasklist = Tasklist.find(params[:id])

    if @tasklist.update_attributes(params[:tasklist])
      redirect_to @tasklist, notice: 'Tasklist was successfully updated.'
    else
      render action: "edit"
    end

  end

  # DELETE /tasklists/1
  # DELETE /tasklists/1.json
  def destroy
    @tasklist = Tasklist.find(params[:id])
    @tasklist.destroy
    redirect_to project_tasklists_path
  end
  
  def list_tasks
    @tasklist = Tasklist.find(params[:id])
    @needed_states = Task::TASK_STATES
    case params[:state]
    when "done"
    	    @needed_states = %w(done)
    when "open"
    	    @needed_states = %w(open processing)
    end
    
    @tasks = Task.find(:all, :conditions => { :tstate => @needed_states, :tasklist_id => params[:id]})
    
    render action: "list_tasks"
  end

  private

  def correct_user
    begin
      @project = Project.find(params[:project_id])
    rescue
      redirect_to user_path(current_user), notice: "Wrong project identifier."
    ensure
      redirect_to user_path(current_user), notice: 'You are not allowed to access this content.' unless @project.nil? or @project.collaborators.include?(current_user)
    end

  end

end

