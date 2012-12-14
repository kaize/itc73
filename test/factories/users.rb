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

    trait :active do
      state :active
    end

    trait :admin do
      state :active
      admin true
    end

    trait :reg do
      personal_data_processing true
    end
  end
end
