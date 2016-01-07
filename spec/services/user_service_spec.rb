require './app/services/user_service'
require 'rails_helper'

describe UserService do
  describe "#update" do
    it "accepts nested params for full profile" do
      user = FactoryGirl.create(:user)
      incoming_params = { 
        :first_name => "John", 
        :last_name => "Doe", 
        :username => "my_username", 
        :full_profile => 
        { 
          :proposal_comments => "Some comments", 
          :associations => "My associations", 
          :interests => "My interests" 
        }
      }

      UserService.update(user, incoming_params)
      user.reload

      expect(user.first_name).to eq("John")
      expect(user.last_name).to eq("Doe")
      expect(user.username).to eq("my_username")

      full_profile = user.full_profile
      expect(full_profile.associations).to eq("My associations")
      expect(full_profile.interests).to eq("My interests")
      expect(full_profile.proposal_comments).to eq("Some comments")
    end
  end
end
