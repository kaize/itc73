class Web::UsersController < Web::ApplicationController
  def new
    @user = UserRegistrationType.new
  end

  def create
    @user = UserRegistrationType.new params[:user]
    if @user.save
      token = @user.build_auth_token
      token.save!
      UserMailer.confirm_registration(@user, token).deliver
      flash_success
      redirect_to root_path
    else
      flash_error
      render :new
    end
  end

end
