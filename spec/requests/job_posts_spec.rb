require 'rails_helper'

RSpec.describe "JobPosts", :type => :request do
  describe "GET /job_posts" do
    it "works! (now write some real specs)" do
      get job_posts_path
      expect(response.status).to be(200)
    end
  end
end
