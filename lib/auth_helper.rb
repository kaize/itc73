module AuthHelper

  class AuthException < StandardError
  end

  class ApiAuthException < AuthException
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def signed_in?
    !current_user.guest?
  end

  def api_authenticate!
    raise ApiAuthException unless current_user.admin?
  end

  def authenticate_admin!
    unless current_user.admin?
      redirect_to new_user_session_path
    end
  end

  def current_user
    @current_user ||=
      session[:user_id] && User.active.find_by_id(session[:user_id]).decorate ||
      User::Guest.new
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |user, password|
      user == configus.basic_auth.username && password == configus.basic_auth.password
    end
  end

end
