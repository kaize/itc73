class Web::UsersController < Web::ApplicationController
  def new
    @user = UserRegistrationType.new
  end

  def create
    @user = UserRegistrationType.new params[:user]
    if @user.save
      UserMailer.registred(@user).deliver
      flash_success
      redirect_to root_path
    else
      flash_error
      render :new
    end
  end
end
