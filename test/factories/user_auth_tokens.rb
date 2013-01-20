FactoryGirl.define do
  factory :auth_token do
    user
    authentication_token {FactoryGirl.generate :token}
    expired_at Time.current + 1.hour 
  end
end