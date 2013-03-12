class Web::AuthController < Web::ApplicationController

  def failure
    flash_error
    redirect_to root_path
  end


  def authorization_finish
    @user = UserAuthorizationType.find_or_initialize_by_email(params[:user][:email])
    @user.attributes = params[:user]
    @user.password = SecureHelper.generate_password
    saving_user
  end


  def facebook
    authorization = Authorization.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid])

    if authorization && authorization.user
      sign_in authorization.user
      flash_success
      redirect_to root_path
    else
      @user = UserAuthorizationType.find_or_initialize_by_email(auth_hash[:info][:email])

      if @user.new_record?
        @user = UserPopulator.via_facebook(@user, auth_hash)
        @user.authorizations << build_authorization(auth_hash)
        render :authorization_finish
      else
        @user.authorizations << build_authorization(auth_hash)
        saving_user
      end
    end
  end

  def twitter
    authorization = Authorization.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid])

    if authorization && authorization.user
      sign_in authorization.user

      flash_success
      redirect_to root_path
    else
      @user = UserAuthorizationType.find_or_initialize_by_email(auth_hash[:info][:email])

      if @user.new_record?
        @user = UserPopulator.via_twitter(@user, auth_hash)
        @user.authorizations << build_authorization(auth_hash)
        render :authorization_finish
      else
        @user.authorizations << build_authorization(auth_hash)
        saving_user
      end
    end
  end

  def vkontakte
    authorization = Authorization.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid])

    if authorization && authorization.user
      sign_in authorization.user

      flash_success
      redirect_to root_path
    else
      @user = UserAuthorizationType.find_or_initialize_by_email(auth_hash[:info][:email])

      if @user.new_record?
        @user = UserPopulator.via_vkontakte(@user, auth_hash)
        @user.authorizations << build_authorization(auth_hash)
        render :authorization_finish
      else
        @user.authorizations << build_authorization(auth_hash)
        saving_user
      end
    end
  end

  def github
    authorization = Authorization.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid])

    if authorization && authorization.user
      sign_in authorization.user

      flash_success
      redirect_to root_path
    else
      @user = UserAuthorizationType.find_or_initialize_by_email(auth_hash[:info][:email])

      if @user.new_record?
        @user = UserPopulator.via_github(@user, auth_hash)
        @user.authorizations << build_authorization(auth_hash)
        render :authorization_finish
      else
        @user.authorizations << build_authorization(auth_hash)
        saving_user
      end
    end
  end

  private

  def saving_user
    if @user.save
      @user.activate
      sign_in @user
      flash_success
      redirect_to  root_path
    else
      flash_error now: true
      render :authorization_finish
    end
  end

end
