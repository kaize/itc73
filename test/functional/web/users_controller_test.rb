require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  def setup
    graduate = create :graduate
    @attrs = attributes_for :user, :reg
    @attrs.merge! graduate_id: graduate.id, password_confirmation: @attrs[:password]

    @user = create :user, :new
    @token = @user.create_auth_token
    @token.save!
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

  test "should activate user with auth token" do
    assert !@user.active?

    get :activate, id: @user.id, auth_token: @token.authentication_token
    assert_response :redirect

    @user.reload
    assert @user.active?
  end

end
