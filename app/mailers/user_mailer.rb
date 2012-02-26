class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def activation_needed_email(user)
    @user = user
    @url = "http://voyager-dev.herokuapp.com/users/#{user.activation_token}/activate"
    mail(:to => user.email, :subject => "Welcome to Voyager - Cracow social community page!")
  end
  
  def reset_password_email(user)
    @user = user
    @url = "http://voyager-dev.herokuapp.com/password_resets/#{user.reset_password_token}/edit"
    mail(:to => user.email, :subject => "Your password reset request")
  end
end
