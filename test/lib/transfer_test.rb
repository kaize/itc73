require 'test_helper'
class TransferTest < ActiveSupport::TestCase 
  def setup
    @transferer = Transfer.new
  end
  test "should_transfer_user_date" do
    @transferer.transfer_info
    assert_equal true, @transferer.users_transfered?
  end
end
