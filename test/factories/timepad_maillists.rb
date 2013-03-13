FactoryGirl.define do
  factory :timepad_maillist do
    name 
    items_count {generate :integer}
    original_id { generate :integer}
  end
end
