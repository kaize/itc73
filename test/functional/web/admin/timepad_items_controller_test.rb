require 'test_helper'

class Web::Admin::TimepadItemsControllerTest < ActionController::TestCase
  setup do
    set_http_referer

    @maillist = create :timepad_maillist

    TimepadItemsExporter.stubs(:run).returns({result: 'ok'})
  end

  test "should export items" do
    put :export, timepad_maillists: { id: @maillist.id }
    assert_response :redirect
  end

end
