class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :title
  
  before_filter :basic_auth if Rails.env.staging?
  before_filter :sign_in_by_token

  private
  def title(part = nil)
    @parts ||= []
    unless part
      return nil if @parts.blank?
      return @parts.reverse.join(' - ')
    end
    @parts << part
  end

  include AuthHelper
  include SocNetworkHelper

  helper_method :signed_in?, :current_user

end
