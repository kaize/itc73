require 'test_helper'

class Api::OrganizersControllerTest < ActionController::TestCase
  setup do
    admin = create :user, :admin
    sign_in admin

    @organizer = create :organizer
    @attrs = attributes_for :organizer
  end

  test "should update organizers order" do
    put :mass_update_order, ids: [@organizer.id]
    assert_response :success
  end
end
