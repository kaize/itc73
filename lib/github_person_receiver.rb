class GithubPersonReceiver

  def init_user_from_hash(user, auth_hash)
    user.email = auth_hash[:info][:email]
    user.first_name = auth_hash[:info][:first_name]
    user.last_name = auth_hash[:info][:last_name]
    user.password = SecureHelper.generate_password
    user
  end

end
