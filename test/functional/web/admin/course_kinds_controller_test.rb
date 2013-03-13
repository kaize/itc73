require 'test_helper'

class Web::Admin::CourseKindsControllerTest < ActionController::TestCase
  setup do
    admin = create :user, :admin
    sign_in admin

    @kind = create :course_kind
    @attrs = attributes_for :course_kind
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
    post :create, course_kind: @attrs
    assert_response :redirect

    assert Course::Kind.find_by_name @attrs[:name]
  end

  test "should get edit" do
    get :edit, id: @kind.id
    assert_response :success
  end

  test "should put update" do
    put :update, id: @kind.id, course_kind: @attrs
    assert_response :redirect

    assert Course::Kind.find_by_name @attrs[:name]
  end

  test "should delele destroy" do
    delete :destroy, id: @kind.id
    assert_response :redirect

    assert_nil Course::Kind.find_by_id @kind
  end
end
