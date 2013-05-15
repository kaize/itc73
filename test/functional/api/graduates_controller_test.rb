require 'test_helper'

class Api::GraduatesControllerTest < ActionController::TestCase
  setup do
    admin = create :user, :admin
    admin.activate
    sign_in admin

    @graduate = create :graduate
    @attrs = attributes_for :graduate
  end

  test "should update graduates order" do
    put :mass_update_order, ids: [@graduate.id]
    assert_response :success
  end
end
