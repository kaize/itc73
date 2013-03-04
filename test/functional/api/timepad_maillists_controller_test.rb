require 'test_helper'

class Api::TimepadMaillistsControllerTest < ActionController::TestCase
  setup do
    admin = create :user, :admin
    sign_in admin
    @maillist = create :timepad_maillist
    @list = {
      id: @maillist.original_id,
      name: @maillist.name,
      itemsCount: @maillist.items_count
    }
    TimepadMaillistsImporter.stubs(:run).returns([@list])

  end
  test "should import list" do
    put :import, format: :json
    assert_response :success
  end
end
