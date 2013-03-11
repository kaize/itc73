module OmniauthAuthentificate

  def authorization_detailing
    @user = UserAuthorizationType.find_or_initialize_by_email(auth_hash[:info][:email])

    if @user.new_record?
      initialize_user_by_hash(@user)
      @user.authorizations << build_authorization(auth_hash)
      render :authorization_finish
    else
      @user.authorizations << build_authorization(auth_hash)
      saving_user
    end
  end

  def callback
    authorization = Authorization.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid])

    if authorization && authorization.user
      sign_in authorization.user
      flash_success
      redirect_to root_path
    else
      authorization_detailing
    end
  end

end
