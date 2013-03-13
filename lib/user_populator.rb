module UserPopulator

  def self.via_facebook(user, auth_hash)
    user.email = auth_hash[:info][:email]
    user.first_name = auth_hash[:info][:first_name]
    user.last_name = auth_hash[:info][:last_name]
    user.password = SecureHelper.generate_password
    user
  end
  def self.via_vkontakte(user, auth_hash)
    user.email = auth_hash[:info][:email]
    user.first_name = auth_hash[:info][:first_name]
    user.last_name = auth_hash[:info][:last_name]
    user.password = SecureHelper.generate_password
    user
  end
  def self.via_twitter(user, auth_hash)
    user.email = auth_hash[:info][:email]
    name = auth_hash[:info][:name].split(" ")
    user.first_name = name.first
    user.last_name = name.last
    user.password = SecureHelper.generate_password
    user
  end
  def self.via_github(user, auth_hash)
    user.email = auth_hash[:info][:email]
    user.first_name = auth_hash[:info][:first_name]
    user.last_name = auth_hash[:info][:last_name]
    user.password = SecureHelper.generate_password
    user
  end

end

