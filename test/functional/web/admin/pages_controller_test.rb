require 'test_helper'

class Web::Admin::PagesControllerTest < ActionController::TestCase
  setup do
    set_http_referer

    admin = create :user, :admin
    admin.activate
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
    get :edit, id: @page.slug
    assert_response :success
  end

  test "should put update" do
    put :update, id: @page.slug, page: @attrs
    assert_response :redirect

    assert Page.find_by_name @attrs[:name]
  end

  test "should delete destroy" do
    delete :destroy, id: @page.slug
    assert_response :redirect

    assert !Page.exists?(@page)
  end

  test "should not delete page with system slug" do
    page = Page.find_by_slug! configus.page_slugs.first
    delete :destroy, id: page.slug
    assert_response :redirect

    assert Page.exists?(page)
  end
end
