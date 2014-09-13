class UserMailer < ActionMailer::Base
  default from: "no-reply@emangu.com"

  def welcome_email(user)
    @user = user
    @url  = "http://#{@user.username}.emangu.com"
    mail(:to => user.email,
         :subject => "Welcome to Emangu")
  end
  
end
