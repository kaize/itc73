FactoryGirl.define do
  factory :course do
    name
    description
    subscribe_state :allowed
  end
end
