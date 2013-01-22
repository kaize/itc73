require 'test_helper'

class Web::Admin::NewsControllerTest < ActionController::TestCase
  setup do
    admin = create :user, :admin
    admin.activate
    sign_in admin

    @news = create :news
    @attrs = attributes_for :news
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
    get :edit, id: @news.id
    assert_response :success
  end

  test "should post create" do
    post :create, news: @attrs
    assert_response :redirect

    assert News.find_by_name(@attrs[:name])
  end

  test "should put update" do
    put :update, id: @news.id, news: @attrs
    assert_response :redirect

    assert News.find_by_name(@attrs[:name])
  end

  test "should delete destroy" do
    delete :destroy, id: @news.id
    assert_response :redirect

    assert_nil News.find_by_id(@news)
  end

end
