require 'rails_helper'

RSpec.describe "Industries", :type => :request do
  describe "GET /industries" do
    it "works! (now write some real specs)" do
      get industries_path
      expect(response.status).to be(200)
    end
  end
end
