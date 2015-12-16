require 'rails_helper'

RSpec.describe "JobPosts", :type => :request do
  describe "GET /job_posts" do
    it "works! (now write some real specs)" do
      user = FactoryGirl.create(:user, :password => 'password')
      post user_session_path, :email => user.email, :password => 'password'
      expect(response.status).to be(200)
      get job_posts_path
     #  expect(response.status).to be(200)
    end
  end

  def login(user)
    post user_session_path(user), :email => user.email, :password => 'password'
  end
end
