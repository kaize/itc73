require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  def setup
    @attrs = attributes_for :user
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    post :create, user: @attrs
    assert_response :redirect

    assert User.find_by_email(@attrs[:email])
  end

end
