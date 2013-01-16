class UserMailer < ActionMailer::Base
  default_url_options[:host] = "itc73.kaize.ru"  
  default from: "noreplay@itc73.kaize.ru"

  def registred(user)
    @user = user
    @url = "user.authentication_token"
    mail(:to => user.email, :subject => "Registered!")
  end

end
