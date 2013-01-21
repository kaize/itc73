class Web::Account::UsersController < Web::ApplicationController

  def activate
    if current_user.can_activate?
      current_user.fire_state_event(:activate)
      flash_success
      redirect_to root_path
    else
      flash_error
      redirect_to new_session_path
    end
  end

end
