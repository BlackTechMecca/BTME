require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  login_user

  let(:valid_attributes) {
    { :title => "Developer",
      :description => "Job Description text",
      :date => Date.today,
    }
  }
  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { :username => "my_username",
          :first_name => "Chrissie", 
          :last_name => "Deist",
          :full_profile => [:associations => "My associations", :interests => "My interests"],
        }
      }
  
      it "updates the requested user" do
        put :update, {:id => @current_user.to_param, :user => new_attributes}
        user.reload
        expect(user.title).to eq("New Developer")
        expect(user.description).to eq("New job Description text")
      end
  
      it "assigns the requested user as @user" do
        user = subject.current_user.users.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}
        expect(assigns(:user)).to eq(user)
      end
  
      it "redirects to the user" do
        user = subject.current_user.users.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}
        expect(response).to redirect_to(user)
      end
    end
  
    # describe "with invalid params" do
    #   it "assigns the job_post as @job_post" do
    #     job_post = subject.current_user.job_posts.create! valid_attributes
    #     put :update, {:id => job_post.to_param, :job_post => invalid_attributes}
    #     expect(assigns(:job_post)).to eq(job_post)
    #   end
    #
    #   it "re-renders the 'edit' template" do
    #     job_post = subject.current_user.job_posts.create! valid_attributes
    #     put :update, {:id => job_post.to_param, :job_post => invalid_attributes}
    #     expect(response).to render_template("edit")
    #   end
    # end
  end

end
