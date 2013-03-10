class Web::Social::NetworkController < Web::ApplicationController

  def get_user_from_hash(user)
  end

  def user_create_or_sign_in 
    @user = User.find_or_initialize_by_email(auth_hash[:info][:email])

    if @user.new_record?
      get_user_from_hash(@user)
    end
    @user.authorizations << build_authorization(auth_hash)
    if @user.save
      @user.activate
      sign_in @user
      flash_success
      redirect_to root_path
    else
      render :authorization_finish
    end
  end
  def callback
    authorization = Authorization.find_by_provider_and_uid(auth_hash[:provider], auth_hash[:uid])

    if authorization && authorization.user
      sign_in authorization.user
      flash_success
      redirect_to root_path
    else
      user_create_or_sign_in
    end
  end
  def authorization_finish
    @user = User.find_or_initialize_by_email(params[:user][:email])
    @user.password = SecureHelper.generate_password
    if @user.save
      @user.activate
      sign_in @user
      flash_success
      redirect_to root_path
    else
      flash_error now: true
      render :authorization_finish
    end
  end

  def failure
    flash_error
    redirect_to root_path
  end

end
