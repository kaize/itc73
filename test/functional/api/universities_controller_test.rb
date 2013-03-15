require 'test_helper'

class Api::UniversitiesControllerTest < ActionController::TestCase
  setup do 
    admin = create :user, :admin
    sign_in admin
  end

  test "should get index" do
    get :index, format: :json, term: "ulstu"
    assert_response :success
  end
end 

