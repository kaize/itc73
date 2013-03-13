require  'test_helper'

class TimepadItemsExporterTest < ActiveSupport::TestCase
  setup do
    @user = create :user
    @user.subscribe = true
    @user.save

    @maillist = create :timepad_maillist

    @response = { result: 'ok'}
    Timepad.maillist.stubs(:add_items).returns(@response)
  end

  test "should export items" do
    response = TimepadItemsExporter.run(@maillist.id, User.all)
    assert_equal @response, response.pop
  end
end
