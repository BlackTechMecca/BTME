FactoryGirl.define do
  factory :activity do

    trait :job_posting do
      postable_type JobPosting
      postable_id 123
    end
  end
end
