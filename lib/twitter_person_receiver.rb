class TwitterPersonReceiver

  def init_user_from_hash(user, auth_hash)
    user.email = auth_hash[:info][:email]
    name = auth_hash[:info][:name].split(" ")
    user.first_name = name.first
    user.last_name = name.last
    user.password = SecureHelper.generate_password
    user
  end

end
