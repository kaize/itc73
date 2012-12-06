require 'test_helper'

class Web::Admin::PagesControllerTest < ActionController::TestCase
  setup do
    admin = create :user, :admin
    sign_in admin

    @page = create :page
    @attrs = attributes_for :page
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
    post :create, page: @attrs
    assert_response :redirect

    assert Page.find_by_name @attrs[:name]
  end

  test "should get edit" do
    get :edit, id: @page.id
    assert_response :success
  end

  test "should put update" do
    put :update, id: @page.id, page: @attrs
    assert_response :redirect

    assert Page.find_by_name @attrs[:name]
  end
end