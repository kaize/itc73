require 'test_helper'

class Web::Admin::MaterialsControllerTest < ActionController::TestCase
  setup do
    admin = create :user, :admin
    admin.activate
    sign_in admin

    @material = create :material
    @attrs = attributes_for :material
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
    post :create, material: @attrs
    assert_response :redirect

    assert Material.find_by_name @attrs[:name]
  end

  test "should get edit" do
    get :edit, id: @material.id
    assert_response :success
  end

  test "should put update" do
    put :update, id: @material.id, material: @attrs
    assert_response :redirect

    assert Material.find_by_name @attrs[:name]
  end

  test "should delele destroy" do
    delete :destroy, id: @material.id
    assert_response :redirect

    assert_nil Material.find_by_id @material
  end
end
