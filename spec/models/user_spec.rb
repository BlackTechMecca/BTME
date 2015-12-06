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
end
