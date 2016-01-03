require 'rails_helper'

RSpec.describe User, :type => :model do

  describe "#full_name" do
    it "returns the first and last name" do
      user = FactoryGirl.create(
        :user, 
        :first_name => "Firsty",
        :last_name => "Lasty",
      )

      expect(user.full_name).to eq("Firsty Lasty")
    end
  end

  it "updates the last modified timestamp on full_profile after being saved" do
    user = FactoryGirl.create(:user)

    expect do 
      user.update_attribute(:image_url, "www.new_url.com")
    end.to change { user.full_profile.last_modified_timestamp }
  end
end
