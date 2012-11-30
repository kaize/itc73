require 'test_helper'

class Web::NewsControllerTest < ActionController::TestCase
  setup do
    @news = create :news
  end

  test "should get news index" do
    get :index
    assert_response :success
  end

end
