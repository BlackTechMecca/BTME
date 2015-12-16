require 'rails_helper'

RSpec.describe ActivitiesController, :type => :controller do
  render_views

  before(:each) do
    15.times do
      FactoryGirl.create(:job_post)
    end
  end

  describe "#index" do
    it "displays the most recent 10 activities" do
      get :index

      expect(response.status).to be 200
      activities = assigns(:recent_activities)
      expect(activities.count).to eq(10)
    end
  end
end
