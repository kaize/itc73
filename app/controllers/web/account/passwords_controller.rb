class Web::Account::PasswordsController < Web::ApplicationController

  def edit
    @user = UserPasswordEditType.new
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash_success
      redirect_to root_path
    else
      flash_error
      render :edit
    end
  end

end