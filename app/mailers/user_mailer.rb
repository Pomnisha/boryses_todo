class UserMailer < ActionMailer::Base
  default from: "rashba@gmail.com"

  def welcome_email(user)
    @user = user
    @url  = "http://0.0.0.0:3000/singin"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end

end
