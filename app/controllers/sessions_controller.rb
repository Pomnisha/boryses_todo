class SessionsController < ApplicationController

  def new
    respond_to do |format|
      if signed_in?
        format.html { redirect_back_or current_user }
        format.json { render json: current_user , status: :created, location: user}
      else
        format.html { render action: "new" }
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
    respond_to do |format|
      if user.nil?
        flash.now[:error] = "Invalid email/password combination."
        format.html { render action: "new" }
        format.json { render json: user.errors, status: :unprocessable_entity }
      else
        sign_in user
        format.html { redirect_back_or user }
        format.json { render json: user , status: :created, location: user}
      end
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end