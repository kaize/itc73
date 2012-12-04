FactoryGirl.define do
  factory :course do
    name
    description
    kind { generate :string }
    level { generate :string }
  end
end
