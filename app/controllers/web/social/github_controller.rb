class Web::Social::GithubController < Web::Social::NetworkController

  def get_user_from_hash(user)
    @user = UserPopulator.via_github(user, auth_hash)
  end

end
