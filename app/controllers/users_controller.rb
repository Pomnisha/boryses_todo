class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :sign_out_before_do_this, :only => :new
  before_filter :correct_user, :only => [ :edit, :update, :destroy, :show]

  # GET /users/1
  # GET /users/1.json

  def show
    @user = User.find(params[:id])
    @title = "Users profile"
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    if @user.save
      sign_in @user
      redirect_to user_path(current_user), notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to user_path(current_user), notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json

# Don't know how to organize yet.'
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end


  private

  def sign_out_before_do_this
    deny_access if user_signed_in?
  end

# to ask is it correct
  def correct_user
    redirect_to root_path, :notice => "You are not allowed to access this content."  unless current_user.id.to_s == params[:id].to_s
  end

end
