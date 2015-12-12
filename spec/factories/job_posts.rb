FactoryGirl.define do
  factory :job_post do
    title       { Faker::Name.title }
    description { Faker::Lorem.sentence }
    user        { FactoryGirl.create(:user) }
    date "2015-12-10"
  end
end
