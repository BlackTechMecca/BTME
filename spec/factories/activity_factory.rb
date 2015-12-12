FactoryGirl.define do
  factory :activity do

    trait :job_post do
      postable_type JobPost
      postable_id 123
    end
  end
end
