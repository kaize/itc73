require 'test_helper'

class Web::Account::CoursesControllerTest < ActionController::TestCase
  
  setup do
    user = create :user
    user.activate
    sign_in user
    course = create :course
    user.courses = [].push course 
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
