class Web::Account::UsersController < Web::ApplicationController
  skip_before_filter :sign_in_by_token, only: :activate

  def activate
    if params[:auth_token]
      token = User::AuthToken.find_by_authentication_token params[:auth_token]
      if token && !token.expired?
        user = token.user
        if user.can_activate?
          user.activate 
          sign_in(user)
          flash_success
          redirect_to root_path
          return
        end
      end
    end
    flash_error
    redirect_to new_session_path
  end

end
