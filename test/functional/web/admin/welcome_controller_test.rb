require 'test_helper'

class Web::Admin::WelcomeControllerTest < ActionController::TestCase
  setup do
    admin = create :user, :admin
    admin.activate
    sign_in admin
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
