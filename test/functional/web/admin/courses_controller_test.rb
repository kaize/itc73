require 'test_helper'

class Web::Admin::CoursesControllerTest < ActionController::TestCase
  setup do
    admin = create :user, :admin
    admin.activate
    sign_in admin

    @course = create :course
    @attrs = attributes_for :course
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
    post :create, course: @attrs
    assert_response :redirect

    assert Course.find_by_name @attrs[:name]
  end

  test "should get edit" do
    get :edit, id: @course.id
    assert_response :success
  end

  test "should put update" do
    put :update, id: @course.id, course: @attrs
    assert_response :redirect

    assert Course.find_by_name @attrs[:name]
  end

  test "should delele destroy" do
    delete :destroy, id: @course.id
    assert_response :redirect

    assert_nil Course.find_by_id @course
  end

  test "should put subscribe_state_event" do
    put :subscribe_state_event, id: @course.id, event: :deny
    assert_response :redirect

    @course.reload
    assert @course.denied?
  end
end
