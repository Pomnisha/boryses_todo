class TasklistsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user, :only => [:new, :show, :edit, :update, :destroy]
  before_filter :need_tasklist, :only => [:new]

  # GET /tasklists
  # GET /tasklists.json

# Don't know whether the action is necessary'
# List of tasklists is present in projects view.
=begin
  def index

    @tasklists = Tasklist.all

    respond_to do |format|
      format.html # index.html.haml
    end
=end

  # GET /tasklists/1
  # GET /tasklists/1.json
  def show
#    @tasklist = Tasklist.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
    end
  end

  # GET /tasklists/new
  # GET /tasklists/new.json
  def new
#    @tasklist = Tasklist.new(params[:tasklist])
#    @project = Project.find(params[:project_id]) and @tasklist.project = @project if !params[:project_id].nil?
    respond_to do |format|
      format.html { render action: "new"}
    end
  end


  # GET /tasklists/1/edit
  def edit
#    @tasklist = Tasklist.find(params[:id])
  end

  # POST /tasklists
  # POST /tasklists.json
  def create
    @tasklist = Tasklist.new(params[:tasklist])

    respond_to do |format|
      if @tasklist.save
        format.html { redirect_to @tasklist, notice: 'Tasklist was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /tasklists/1
  # PUT /tasklists/1.json
  def update
#    @tasklist = Tasklist.find(params[:id])

    respond_to do |format|
      if @tasklist.update_attributes(params[:tasklist])
        format.html { redirect_to @tasklist, notice: 'Tasklist was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /tasklists/1
  # DELETE /tasklists/1.json
  def destroy
#    @tasklist = Tasklist.find(params[:id])
    @tasklist.destroy

    respond_to do |format|
      format.html { redirect_to tasklists_url }
    end
  end
  
  def list_tasks
#    @tasklist = Tasklist.find(params[:id])
    @needed_states = Task::TASK_STATES
    case params[:state]
    when "done"
    	    @needed_states = %w(done)
    when "open"
    	    @needed_states = %w(open processing)
    end
    
    @tasks = Task.find(:all, :conditions => { :tstate => @needed_states, :tasklist_id => params[:id]})
    
    respond_to do |format|
      format.html # list_tasks.html.erb
    end
  end

  private

  def correct_user
    if params[:id].nil? then
      @tasklist = Tasklist.new(params[:tasklist])
    else
      @tasklist = Tasklist.find(params[:id])
    end

      if !@tasklist.nil? then
        @project = @tasklist.project
        redirect_to root_path, notice: 'You are not allowed to access this content.' unless @project.collaborators.include?(current_user)
      else
        redirect_to root_path, notice: 'Wrong list of tasks identifier.'
      end

  end

  def need_tasklist
    @project = Project.find(params[:project_id])
    if @project.tasklists.empty? then
      redirect_to new_tasklist_path(params[:taklist] => {[:project_id] => @project.id}), :notice => 'There are no lists of tasks in current project. Please create one firstly.'
    end
  end

end

