FactoryGirl.define do
  sequence :integer do |n|
    n
  end

  sequence :date do |n|
    Date.today - 1000 - n
  end

  sequence :name do |n|
    "Name#{n}"
  end

  sequence :slug do |n|
    "slug#{n}"
  end

  sequence :string do |n|
    "String#{n}"
  end

  sequence :body do |n|
    FactoryGirl.generate(:string) * 100
  end

  sequence :email do |n|
    "email-#{n}@example.com"
  end

  sequence :url do |n|
    "http://url-#{n}.com/url#{n}"
  end
end
