FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "person#{n}" }
    sequence(:email) { |n| "person#{n}@example.com" }
    password 'this is a very secure password'
    password_confirmation 'this is a very secure password'
  end
end
