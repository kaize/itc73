class Web::Auth::TwitterController < Web::Auth::NetworkController

  def initialize_user_by_hash(user)
    @user = UserPopulator.via_twitter(user, auth_hash)
  end

end

