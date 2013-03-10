class Web::Social::FacebookController < Web::Social::NetworkController

  def get_user_from_hash(user)
    @user = UserPopulator.via_facebook(user, auth_hash)
  end

end
