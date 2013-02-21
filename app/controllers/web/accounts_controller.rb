class Web::AccountsController < Web::ApplicationController
  def edit
    @user = current_user
    add_breadcrumb @user, edit_admin_user_path(@user)
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes params[:user]
      flash_success
      redirect_to root_path
    else
      flash_error
      add_breadcrumb :edit, edit_user_path(@user)
      render :edit
    end
  end
end
