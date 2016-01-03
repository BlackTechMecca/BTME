require "rails_helper"

RSpec.describe FullProfilesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/full_profiles").to route_to("full_profiles#index")
    end

    it "routes to #new" do
      expect(:get => "/full_profiles/new").to route_to("full_profiles#new")
    end

    it "routes to #show" do
      expect(:get => "/full_profiles/1").to route_to("full_profiles#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/full_profiles/1/edit").to route_to("full_profiles#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/full_profiles").to route_to("full_profiles#create")
    end

    it "routes to #update" do
      expect(:put => "/full_profiles/1").to route_to("full_profiles#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/full_profiles/1").to route_to("full_profiles#destroy", :id => "1")
    end

  end
end
