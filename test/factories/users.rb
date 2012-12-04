FactoryGirl.define do
  factory :user do
    email
    password { generate :string }
    first_name { generate :name }
    last_name { generate :name }
    birthday { generate :date }
    education { generate :string }
    phone { generate :string }

    trait :active do
      state :active
    end

    trait :admin do
      state :active
      admin true
    end
  end
end
