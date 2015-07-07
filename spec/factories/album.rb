require 'factory_girl'
FactoryGirl.define do
  factory :album do
    association :user
    sequence(:name) { |n| "furkitt#{n}" }
  end
end
