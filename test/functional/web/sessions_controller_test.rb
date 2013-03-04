require 'test_helper'

class Web::SessionsControllerTest < ActionController::TestCase
  def setup
    @user = create :user
  end

  test "should authenticate" do
    attrs = { email: @user.email, password: @user.password }
    post :create, session: attrs
    assert_response :redirect
    assert signed_in?
  end

  test "should not authenticate" do
    attrs = { email: @user.email, password: 'wrong_password' }
    post :create, session: attrs
    assert_response :success
    assert !signed_in?
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should delete destroy" do
    sign_in @user
    delete :destroy
    assert_response :redirect
    assert !signed_in?
  end
end
