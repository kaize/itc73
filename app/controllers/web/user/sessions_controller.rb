class Web::User::SessionsController < Web::ApplicationController
  layout 'web/admin/application'

  def new
  end

  def create
    @email = params[:session][:email]
    user = User.active.find_by_email(@email)
    if user && user.authenticate(params[:session][:password])
      reset_session
      sign_in(user)
      redirect_to admin_root_path
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
