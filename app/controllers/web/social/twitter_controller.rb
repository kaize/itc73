class Web::Social::TwitterController < Web::Social::NetworkController

  def get_user_from_hash(user)
    @user = UserPopulator.via_twitter(user, auth_hash)
  end

end

