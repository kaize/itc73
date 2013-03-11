class Web::FacebookController < Web::NetworksController
  include OmniauthAuthentificate
  def initialize_user_by_hash(user)
    @user = UserPopulator.via_facebook(user, auth_hash)
  end

end
