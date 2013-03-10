require 'test_helper'

class Web::Social::NetworkControllerTest < ActionController::TestCase

  setup do
    @auth_hash = generate(:facebook_auth_hash)
    @user = create :user
  end
  
  test "should get failure" do
    get :failure
    assert_response :redirect
  end

end

