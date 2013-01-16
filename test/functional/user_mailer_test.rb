require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  setup do
    @user = create :user
    ActionMailer::Base.deliveries.clear
  end

  test "should get registred email" do
    assert ActionMailer::Base.deliveries.empty?
    email = UserMailer.registred(@user).deliver
    assert !ActionMailer::Base.deliveries.empty?
    # raise ActionMailer::Base.deliveries.inspect

    assert_equal [@user.email], email.to
    assert_equal "Registered!", email.subject
  end
end
