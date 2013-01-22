require 'test_helper'

class Web::Admin::GraduatesControllerTest < ActionController::TestCase
  setup do
    admin = create :user, :admin
    admin.fire_state_event(:activate)
    sign_in admin

    @graduate = create :graduate
    @attrs = attributes_for :graduate
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    post :create, graduate: @attrs
    assert_response :redirect

    assert Graduate.find_by_name @attrs[:name]
  end

  test "should get edit" do
    get :edit, id: @graduate.id
    assert_response :success
  end

  test "should put update" do
    put :update, id: @graduate.id, graduate: @attrs
    assert_response :redirect

    assert Graduate.find_by_name @attrs[:name]
  end

  test "should delele destroy" do
    delete :destroy, id: @graduate.id
    assert_response :redirect

    assert !Graduate.exists?(@graduate)
  end
end
