require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  login_user

  let(:valid_attributes) {
    { :first_name => "John", :last_name => "Doe", :username => "my_username", :full_profile => { :proposal_comments => "Some comments", :associations => "My associations", :interests => "My interests" }}


  }
  let(:invalid_attributes) { { :token => "Developer" } }
  let(:user) { subject.current_user }

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        put :update, :id => user.to_param, :user => valid_attributes
        user.reload

        expect(user.first_name).to eq("John")
        expect(user.last_name).to eq("Doe")
        expect(user.username).to eq("my_username")

        full_profile = user.full_profile
        expect(full_profile.associations).to eq("My associations")
        expect(full_profile.interests).to eq("My interests")
        expect(full_profile.proposal_comments).to eq("Some comments")
      end
  
      it "assigns the requested user as @user" do
        put :update, {:id => user.to_param, :user => valid_attributes}
        expect(assigns(:user)).to eq(user)
      end
  
      it "redirects to the user" do
        put :update, {:id => user.to_param, :user => valid_attributes}
        expect(response).to redirect_to(user)
      end
    end
  
    describe "with invalid params" do
      it "assigns the user as @user" do
        put :update, {:id => user.to_param, :user => invalid_attributes}
        expect(assigns(:user)).to eq(user)
      end
      #
      # it "re-renders the 'edit' template" do
      #   invalid_attrs = { :password => "abc123" }
      #   put :update, :id => user.to_param, :user => invalid_attrs
      #   expect(response).to render_template("edit")
      # end
    end
  end
end
