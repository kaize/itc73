# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task_file, :class => 'Task::File' do
    file "MyString"
  end
end
