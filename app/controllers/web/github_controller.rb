class Web::GithubController < Web::NetworksController
  include OmniauthAuthentificate

  def initialize_user_by_hash(user)
    @user = UserPopulator.via_github(user, auth_hash)
  end

end
