require 'test_helper'

class Api::CourseKindsControllerTest < ActionController::TestCase
  setup do
    admin = create :user, :admin
    admin.fire_state_event(:activate)
    sign_in admin

    @kind = create :course_kind
    @attrs = attributes_for :course_kind
  end

  test "should update kinds order" do
    put :mass_update_order, ids: [@kind.id]
    assert_response :success
  end
end
