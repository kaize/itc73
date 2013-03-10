module CustomUrlHelper
  extend ActiveSupport::Concern

  def sign_in_via_social_network_cpath(provider)
    "#{OmniAuth.config.path_prefix}/#{provider.to_s}"
  end

end
