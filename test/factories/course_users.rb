# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :course_user do
    course
    user
  end
end
