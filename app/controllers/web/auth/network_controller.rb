class Web::Auth::NetworkController < Web::ApplicationController
  def initialize_user_by_hash(user)

  end

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

  def authorization_finish
    @user = UserAuthorizationType.find_or_initialize_by_email(params[:user][:email])
    @user.attributes = params[:user]
    @user.password = SecureHelper.generate_password
    saving_user
  end

  def failure
    message = [:flash, :controllers] + controller_path.split("/") << "failure"
    flash[:error] = t(:error, scope: message)
    redirect_to root_path
  end

end
