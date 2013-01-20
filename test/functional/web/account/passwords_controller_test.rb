require 'test_helper'

class Web::Account::PasswordsControllerTest < ActionController::TestCase
  setup do
    @user = create :user, :active
    sign_in @user
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get update password" do
    old_password = @user.password_digest
    new_password = "new_pass"
    attrs = { password: new_password, password_confirmation: new_password }

    put :update, :user => attrs
    assert_response :redirect

    @user.reload
    assert_not_equal @user.password_digest, old_password
  end

end
