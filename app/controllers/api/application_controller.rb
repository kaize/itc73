class Api::ApplicationController < ApplicationController
  before_filter :api_authenticate!
  respond_to :json
end
