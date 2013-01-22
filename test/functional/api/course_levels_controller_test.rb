require 'test_helper'

class Api::CourseLevelsControllerTest < ActionController::TestCase
  setup do
    admin = create :user, :admin
    admin.fire_state_event(:activate)
    sign_in admin

    @level = create :course_level
    @attrs = attributes_for :course_level
  end

  test "should update levels order" do
    put :mass_update_order, ids: [@level.id]
    assert_response :success
  end
end
