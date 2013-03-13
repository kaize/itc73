class Web::SocialNetworksController < Web::ApplicationController

  def failure
    flash_error
    redirect_to root_path
  end

  def authorization
    authorization = Authorization.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid])

    if authorization && authorization.user
      sign_in authorization.user
      flash_success
    else
      @user = User.find_by_email(auth_hash[:info][:email])

      if !@user
        save_auth_hash_to_session
        redirect_to new_user_path
        return
      end

      @user.authorizations << build_authorization(auth_hash)
      saving_user
    end
    redirect_to root_path
  end

  private

  def saving_user
    if @user.save
      @user.activate
      sign_in @user
      flash_success
    else
      flash_error now: true
    end
  end

end
