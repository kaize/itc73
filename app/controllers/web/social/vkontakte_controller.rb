class Web::Social::VkontakteController < Web::Social::NetworkController

  def get_user_from_hash(user)
    @user = UserPopulator.via_vkontakte(user, auth_hash)
  end

end
