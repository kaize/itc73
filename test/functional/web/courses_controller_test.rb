require 'test_helper'

class Web::CoursesControllerTest < ActionController::TestCase
  setup do
    @course = create :course
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @course.id
    assert_response :success
  end

  test "should track courses" do
    get :track
    assert_response :success
  end
end
