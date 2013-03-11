require 'test_helper'

class Web::NetworksControllerTest < ActionController::TestCase

  setup do
    admin = create :user, :admin
    sign_in admin
    @course = create :course
    @user = create :user
    @attrs = attributes_for :user
  end

  test "should get failure" do
    get :failure
    assert_response :redirect
  end

  test "should authorization finish" do
    get :authorization_finish, user: @attrs
    assert_response :redirect
    assert signed_in? 
  end

end

