class TasklistsController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy, :new]

  # GET /tasklists
  # GET /tasklists.json
  def index
    @tasklists = Tasklist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasklists }
    end
  end

  # GET /tasklists/1
  # GET /tasklists/1.json
  def show
    @tasklist = Tasklist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tasklist }
    end
  end

  # GET /tasklists/new
  # GET /tasklists/new.json
  def new
    @tasklist = Tasklist.new
    if !params[:project_id].nil?
      @tasklist.project_id = params[:project_id]
    end
    respond_to do |format|
      format.html { render action: "new"}
      format.json { render json: @tasklist }
    end
  end

  # GET /tasklists/1/edit
  def edit
    @tasklist = Tasklist.find(params[:id])
  end

  # POST /tasklists
  # POST /tasklists.json
  def create
    @tasklist = Tasklist.new(params[:tasklist])

    respond_to do |format|
      if @tasklist.save
        format.html { redirect_to @tasklist, notice: 'Tasklist was successfully created.' }
        format.json { render json: @tasklist, status: :created, location: @tasklist }
      else
        format.html { render action: "new" }
        format.json { render json: @tasklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasklists/1
  # PUT /tasklists/1.json
  def update
    @tasklist = Tasklist.find(params[:id])

    respond_to do |format|
      if @tasklist.update_attributes(params[:tasklist])
        format.html { redirect_to @tasklist, notice: 'Tasklist was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @tasklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasklists/1
  # DELETE /tasklists/1.json
  def destroy
    @tasklist = Tasklist.find(params[:id])
    @tasklist.destroy

    respond_to do |format|
      format.html { redirect_to tasklists_url }
      format.json { head :ok }
    end
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
    
    respond_to do |format|
      format.html # list_tasks.html.erb
    end
  end
  
end
