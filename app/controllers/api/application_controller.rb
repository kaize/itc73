class Api::ApplicationController < ApplicationController
  before_filter :api_authenticate!
end
