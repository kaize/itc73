class Web::AccountsController < Web::ApplicationController
  def edit
    @user = current_user
    add_breadcrumb :edit, edit_account_path(@user)
  end

  def update
    @user = current_user
    if @user.update_attributes params[:user]
      flash_success
      redirect_to root_path
    else
      flash_error now: true
      add_breadcrumb :edit, account_path(@user)
      render :edit
    end
  end
end
