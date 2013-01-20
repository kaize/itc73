require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  setup do
    @user = create :user
    @token = @user.create_auth_token
    @token.save!

    ActionMailer::Base.deliveries.clear
  end

  test "should get confirm registration email" do
    assert ActionMailer::Base.deliveries.empty?
    email = UserMailer.confirm_registration(@user, @token).deliver
    assert !ActionMailer::Base.deliveries.empty?
    assert_match(@token.authentication_token, email.body.to_s)
  end

  test "should get confirm remind password email" do
    assert ActionMailer::Base.deliveries.empty?
    email = UserMailer.remind_password(@user, @token).deliver
    assert !ActionMailer::Base.deliveries.empty?
    assert_match(@token.authentication_token, email.body.to_s)
  end

end
