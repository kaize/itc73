require 'test_helper'

class Web::AccountsControllerTest < ActionController::TestCase

  setup do
    @attrs = attributes_for :user
    @user = create :user
    @user.activate
    sign_in @user
  end
  test "should get edit" do 
    get :edit 
    assert_response :success
  end
  test "should put update" do
    put :update, id: @user.id, user: @attrs
    assert_response :redirect
  end
end
