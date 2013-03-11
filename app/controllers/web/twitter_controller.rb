class Web::TwitterController < Web::NetworksController
  include OmniauthAuthentificate

  def initialize_user_by_hash(user)
    @user = UserPopulator.via_twitter(user, auth_hash)
  end

end

