require 'rails_helper'

RSpec.describe "FullProfiles", :type => :request do
  describe "GET /full_profiles" do
    it "works! (now write some real specs)" do
      get full_profiles_path
      expect(response.status).to be(200)
    end
  end
end
