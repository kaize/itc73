class Web::Auth::GithubController < Web::Auth::NetworkController

  def initialize_user_by_hash(user)
    @user = UserPopulator.via_github(user, auth_hash)
  end

end
