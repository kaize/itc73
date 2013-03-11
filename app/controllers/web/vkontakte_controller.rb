class Web::VkontakteController < Web::NetworksController
  include OmniauthAuthentificate

  def initialize_user_by_hash(user)
    @user = UserPopulator.via_vkontakte(user, auth_hash)
  end

end
