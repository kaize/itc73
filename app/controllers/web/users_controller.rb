class Web::UsersController < Web::ApplicationController
  def new
    @user = UserRegistrationType.new
  end

  def create
    @user = UserRegistrationType.new params[:user]
    if @user.save
      token = @user.create_auth_token
      token.save!
      UserMailer.confirm_registration(@user, token).deliver
      flash_success
      redirect_to root_path
    else
      flash_error
      render :new
    end
  end

  def activate
    sign_in_by_token
    user = current_user
    if signed_in? && user.can_activate?
      user.fire_state_event(:activate)
      flash_success
      redirect_to root_path
    end
  end

end
