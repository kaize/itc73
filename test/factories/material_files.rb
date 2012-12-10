# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :material_file, :class => 'Material::File' do
    file "MyString"
  end
end
