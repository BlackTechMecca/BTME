FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person#{n}@example.com" }
    username Faker::Internet.user_name
    password "password"
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    prefix Faker::Name.prefix
  end
end
