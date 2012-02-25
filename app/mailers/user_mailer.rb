class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def reset_password_email(user)
    @user = user
    @url = "http://voyager-dev.herokuapp.com/password_resets/#{user.reset_password_token}/edit"
    mail(:to => user.email, :subject => "Your password reset request")
  end
end
