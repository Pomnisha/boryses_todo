class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :sign_out_before_do_this, :only => :new
  before_filter :correct_user
  #before_filter :admin_user,   :only => :destroy
  # GET /users
  # GET /users.json
=begin
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
=end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @title = "Users profile"
    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def project
    @project = Project.find(params[:project_id])
    if current_user.projects.include?(@project)
      respond_to do |format|
        format.html { render action: "show" }
      end
    else
      redirect_to current_user
    end
  end

  def tasklist
    @user = User.find(params[:id])
    @tasklist = Tasklist.find(params[:tasklist_id])
    @project = Project.find(@tasklist.project_id)

    if @user.projects.include?(@project)
      respond_to do |format|
        format.html { render action: "show" }
      end
    else
      redirect_to current_user
    end
  end
  
  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver
        sign_in @user
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end


  private

  def sign_out_before_do_this
    deny_access if user_signed_in?
  end


  def correct_user
    redirect_to(root_path) unless current_user.id == params[:id]
  end

end
