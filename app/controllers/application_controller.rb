class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :sign_in_by_token

  include AuthHelper
  include SocNetworkHelper

  helper_method :signed_in?, :current_user

end
