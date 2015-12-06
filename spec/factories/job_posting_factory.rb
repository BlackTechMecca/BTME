FactoryGirl.define do
  factory :job_posting do
    title       { Faker::Name.title }
    description { Faker::Lorem.sentence }
    user        { FactoryGirl.create(:user) }
  end

end
