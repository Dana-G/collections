require 'factory_girl'

FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@example.com"
  end

  factory :user do
    email
    password 'this is a very secure password'
    password_confirmation 'this is a very secure password'
  end
end

FactoryGirl.create(:user)
