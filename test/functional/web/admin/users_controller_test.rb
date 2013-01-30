require 'test_helper'
class Web::Admin::UsersControllerTest < ActionController::TestCase

  def setup
    admin = create :user, :admin
    admin.activate
    sign_in admin

    @user = create :user
    @user.activate
    @attrs = attributes_for :user
    @user_to_test = User.find_by_email(@attrs[:email]).nil?
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user.id
    assert_response :success
  end

  test "should post create" do
    post :create, user: @attrs
    assert_response :redirect
    assert @user_to_test
  end

  test "should put update" do
    put :update, id: @user.id, user: @attrs
    assert_response :redirect
    assert @user_to_test
  end

  test "should put trigger_state_event" do
    put :trigger_state_event, id: @user.id, event: :deactivate
    assert_response :redirect

    @user.reload
    assert @user.inactive?
  end
end
