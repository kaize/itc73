FactoryGirl.define do
  factory :course do
    name
    description
    subscribe :allowed
  end
end
