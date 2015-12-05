FactoryGirl.define do
  factory :job_posting do
    title       Faker::Name.title
    description "A great job"

    user { FactoryGirl.create(:user) }
  end

end
