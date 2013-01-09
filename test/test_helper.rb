require 'simplecov'
SimpleCov.start('rails') if ENV["COVERAGE"]

require 'coveralls'
Coveralls.wear!('rails')

ENV["RAILS_ENV"] = "test"

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each {|f| require f}
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  include AuthHelper
  include TestSupport
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  # fixtures :all

  require 'factory_girl'
  FactoryGirl.reload

  include FactoryGirl::Syntax::Methods
end

def set_http_referer(path)
  request.env['HTTP_REFERER'] = path
end
