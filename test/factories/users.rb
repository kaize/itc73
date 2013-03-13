FactoryGirl.define do
  factory :user do
    email
    password { generate :string }
    first_name { generate :name }
    last_name { generate :name }
    birthday { generate :date }
    university { generate :string }
    edu_year_end { generate :year }
    graduate
    phone { generate :string }
    subscribe true 

    trait :admin do
      admin true
    end

    trait :reg do
      personal_data_processing "1"
    end

    after(:create) do |u|
      u.activate
    end
  end
end
