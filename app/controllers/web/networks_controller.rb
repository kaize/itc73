class Web::NetworksController < Web::ApplicationController

  def failure
    flash_error
    redirect_to root_path
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

  def authorization_finish
    @user = UserAuthorizationType.find_or_initialize_by_email(params[:user][:email])
    @user.attributes = params[:user]
    @user.password = SecureHelper.generate_password
    saving_user
  end

end
