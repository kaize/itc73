class ApplicationController < ActionController::Base
  protect_from_forgery

  include AuthHelper

  helper_method :signed_in?, :current_user

  #before_filter do
    #basic_auth if Rails.env.staging?
  #end

end
