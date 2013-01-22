require 'test_helper'

class Web::Admin::OrganizersControllerTest < ActionController::TestCase
  setup do
    admin = create :user, :admin
    admin.fire_state_event(:activate)
    sign_in admin

    @organizer = create :organizer
    @attrs = attributes_for :organizer
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
    get :edit, id: @organizer.id
    assert_response :success
  end

  test "should post create" do
    post :create, organizer: @attrs
    assert_response :redirect

    assert Organizer.find_by_name(@attrs[:name])
  end

  test "should put update" do
    put :update, id: @organizer.id, organizer: @attrs
    assert_response :redirect

    assert Organizer.find_by_name(@attrs[:name])
  end

  test "should delete destroy" do
    delete :destroy, id: @organizer.id
    assert_response :redirect

    assert_nil Organizer.find_by_id(@organizer.id)
  end

end
