class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  # Devise: Where to redirect users once they have logged in
  def after_sign_in_path_for(resource)
    user_path(current_user) # <- Path you want to redirect the user to.
  end

  def after_sign_up_path_for(resource)
    user_path(current_user) # <- Path you want to redirect the user to.
  end

end
