require 'test_helper'

class Web::Account::UsersControllerTest < ActionController::TestCase
  def setup
    @user = create :user
    @user.deactivate
    @token = @user.build_auth_token
    @token.save!
  end

  test "should activate user with auth token" do
    assert !@user.active?

    get :activate, auth_token: @token.authentication_token
    assert_response :redirect

    @user.reload
    assert @user.active?
  end

end
