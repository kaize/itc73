class Web::Auth::VkontakteController < Web::Auth::NetworkController

  def initialize_user_by_hash(user)
    @user = UserPopulator.via_vkontakte(user, auth_hash)
  end

end
