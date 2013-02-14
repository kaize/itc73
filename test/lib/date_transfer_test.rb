require 'test_helper'

class DateTransferTest < ActiveSupport::TestCase 
  setup do
    @transferer = Transfer.new
  end
  test "should_transfer_user_date" do
    user = @transferer.user
    transferer.transfer_info
    assert_equal true, transferer.changed?
  end
end
