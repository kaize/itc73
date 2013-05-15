require 'test_helper'

class Web::SearchControllerTest < ActionController::TestCase
  setup do
    @course = create :course
  end

  test "should get index" do
  	ThinkingSphinx::Test.run do
      get :index, term: @course.name
      assert_response :success
    end
  end
end
