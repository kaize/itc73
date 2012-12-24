class Web::User::SessionsController < Web::ApplicationController
  add_breadcrumb :index, :new_user_session_path

  def create
    @email = params[:session][:email]
    user = ::User.active.find_by_email(@email)
    if user && user.authenticate(params[:session][:password])
      reset_session
      sign_in(user)
      if admin?(user)  
        redirect_to admin_root_path
      else
        redirect_to root_path
      end
    else
      flash_error
      render action: :new
    end
  end

  def destroy
    sign_out
    redirect_to action: :new
  end
end
