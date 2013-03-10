Rails.application.config.middleware.use OmniAuth::Builder do
  configure do |c|
    c.path_prefix = configus.omniauth.path_prefix
  end

  provider :facebook do
    configus.facebook.app_id
    configus.facebook.app_secret
  end
  
  provider :vkontakte do
    configus.vkontakte.app_id
    configus.vkontakte.app_secret
  end
  
  provider :twitter do 
    configus.twitter.app_id
    configus.twitter.app_secret
  end

  provider :github do 
    configus.github.app_id
    configus.github.app_secret
  end

end
