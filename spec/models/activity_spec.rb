require 'rails_helper'

RSpec.describe Activity, :type => :model do
  describe "#path_to_postable" do
    it "renders the correct path based on the model of the postable" do
      job_post = FactoryGirl.create(:job_post)
      activity = job_post.activity

      expect(activity.path_to_postable).to eq("/job_posts/1")
    end
  end

  def login(user)
    post login_path, :login => user.login, :password => 'password'
  end
end

