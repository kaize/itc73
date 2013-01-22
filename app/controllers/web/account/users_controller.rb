class Web::Account::UsersController < Web::ApplicationController
  skip_before_filter :sign_in_by_token

  def activate
    if params[:auth_token]
      token = User::AuthToken.find_by_authentication_token params[:auth_token]
      if token && !token.expired?
        user = token.user
        user.fire_state_event(:activate) if user.can_activate?
        sign_in(user)
        flash_success
        redirect_to root_path
      else
        flash_error
        redirect_to new_session_path
      end
    end
  end

end
