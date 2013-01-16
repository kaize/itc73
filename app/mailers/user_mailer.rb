class UserMailer < ActionMailer::Base
  default_url_options[:host] = configus.mailer.default_host
  default from: configus.mailer.default_from

  def registred(user)
    @user = user
    mail :to => user.email, :subject => "Registered!"
  end

  def password_reset(user)
    @user = user
    mail :to => user.email, :subject => "Password Reset"
  end

end
