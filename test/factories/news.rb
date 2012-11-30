FactoryGirl.define do
  factory :news do
    title { generate :name }
    content { generate :text }
    published_at { generate :date }
  end
end
