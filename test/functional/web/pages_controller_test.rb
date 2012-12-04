require 'test_helper'

class Web::PagesControllerTest < ActionController::TestCase
  setup do
    @page = create :page
  end

  test "should get show" do
    get :show, id: @page.id
    assert_response :success
  end

  test "should get contacts" do
    get :contacts
    assert_response :success
  end
end
