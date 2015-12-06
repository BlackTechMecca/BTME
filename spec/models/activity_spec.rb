require 'rails_helper'

RSpec.describe Activity, :type => :model do
  describe "#path_to_postable" do
    it "renders the correct path based on the model of the postable" do
      job_posting = FactoryGirl.create(:job_posting)
      activity = job_posting.activity

      expect(activity.path_to_postable).to eq("/job_postings/1")
    end
  end
end

