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
    lists_ids_from_timepad = TimepadMaillistsImporter.run.map{|list| list[:id]}
    local_lists_ids = TimepadMaillist.all.map{|list| list.original_id}
    assert_equal lists_ids_from_timepad, local_lists_ids
  end
end
