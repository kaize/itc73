require 'test_helper'

class Web::Admin::CourseLevelsControllerTest < ActionController::TestCase
  setup do
    admin = create :user, :admin
    sign_in admin

    @level = create :course_level
    @attrs = attributes_for :course_level
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
    post :create, course_level: @attrs
    assert_response :redirect

    assert Course::Level.find_by_name @attrs[:name]
  end

  test "should get edit" do
    get :edit, id: @level.id
    assert_response :success
  end

  test "should put update" do
    put :update, id: @level.id, course_level: @attrs
    assert_response :redirect

    assert Course::Level.find_by_name @attrs[:name]
  end

  test "should delele destroy" do
    delete :destroy, id: @level.id
    assert_response :redirect

    assert_nil Course::Level.find_by_id @level
  end
end
