require 'rails_helper'

RSpec.describe JobPostingsController, :type => :controller do
  describe "#index" do
    it "displays all job postings" do
      10.times { FactoryGirl.create(:job_posting) }
      get :index

      expect(response.status).to be 200
      postings = assigns(:job_postings)
      expect(postings.count).to eq(10)
    end
  end

  describe "#show" do
    it "displays a job posting" do
      FactoryGirl.create(:job_posting, :title => "Developer")

      get :show, :id => 1

      expect(response.status).to be 200
      posting = assigns(:job_posting)
      expect(posting.title).to eq("Developer")
      expect(response).to match(/Developer/)
    end
  end
end
