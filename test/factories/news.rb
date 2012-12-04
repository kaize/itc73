FactoryGirl.define do
  factory :news do
    name
    body
    published_at { generate :date }
  end
end
