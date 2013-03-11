Rails.application.config.middleware.use OmniAuth::Builder do
  configure do |c|
    c.path_prefix = configus.omniauth.path_prefix
    c.on_failure = Proc.new do |env|
      OmniAuth::FailureEndpoint.new(env).redirect_to_failure
    end
  end
  provider :facebook, configus.facebook.app_id,
                      configus.facebook.app_secret

  provider :vkontakte, configus.vkontakte.app_id,
                       configus.vkontakte.app_secret

  provider :twitter, configus.twitter.app_id,
                    configus.twitter.app_secret

  provider :github, configus.github.app_id,
                    configus.github.app_secret

end

