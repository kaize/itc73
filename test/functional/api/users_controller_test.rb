require 'test_helper'

class Api::UsersControllerTest < ActionController::TestCase
  setup do
    admin = create :user, :admin
    sign_in admin
  end

  test "should get index" do
    get :index, format: :xlsx
    assert_response :success
  end
end
