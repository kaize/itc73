require 'test_helper'

class Web::Auth::NetworkControllerTest < ActionController::TestCase

  setup do
    @user = create :user
  end
  
  test "should get failure" do
    get :failure
    assert_response :redirect
  end

end

