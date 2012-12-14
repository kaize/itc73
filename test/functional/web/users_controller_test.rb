require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  def setup
    graduate = create :graduate
    @attrs = attributes_for :user, :reg
    @attrs.merge! graduate_id: graduate.id, password_confirmation: @attrs[:password]
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
