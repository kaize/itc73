class Web::SocialNetworkController < Web::ApplicationController

  def authorization
    authorization = Authorization.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid])

    if authorization
      sign_in authorization.user
      flash_success
    else
      user = User.find_or_initialize_by_email(auth_hash[:info][:email])
      
      if user.new_record?
        user = UserPopulator.via_facebook(user, auth_hash)
      end
        
      user.authorizations << build_authorization(auth_hash)

      if user.save
        user.activate
        sign_in user
        flash_success
      else
        flash_error
      end

    end    
    redirect_to root_path
  end

  def failure
    flash_error
    redirect_to root_path
  end

end
