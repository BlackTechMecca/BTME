require 'rails_helper'

RSpec.describe JobPostsController, :type => :controller do

  login_user

  let(:valid_attributes) {
    { :title => "Developer",
      :description => "Job Description text",
      :date => Date.today,
    }
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET index" do
    it "assigns all job_posts as @job_posts" do
      job_post = subject.current_user.job_posts.create! valid_attributes
      get :index
      expect(assigns(:job_posts)).to eq([job_post])
    end
  end

  describe "GET show" do
    it "assigns the requested job_post as @job_post" do
      job_post = subject.current_user.job_posts.create! valid_attributes
      get :show, {:id => job_post.to_param}
      expect(assigns(:job_post)).to eq(job_post)
    end
  end
  
  describe "GET new" do
    it "assigns a new job_post as @job_post" do
      get :new, {}
      expect(assigns(:job_post)).to be_a_new(JobPost)
    end
  end
  
  describe "GET edit" do
    it "assigns the requested job_post as @job_post" do
      job_post = subject.current_user.job_posts.create! valid_attributes
      get :edit, {:id => job_post.to_param}
      expect(assigns(:job_post)).to eq(job_post)
    end
  end
  
  describe "POST create" do
    describe "with valid params" do
      it "creates a new JobPost" do
        expect {
          post :create, {:job_post => valid_attributes}
        }.to change(JobPost, :count).by(1)
      end
  
      it "assigns a newly created job_post as @job_post" do
        post :create, {:job_post => valid_attributes}
        expect(assigns(:job_post)).to be_a(JobPost)
        expect(assigns(:job_post)).to be_persisted
      end
  
      it "redirects to the created job_post" do
        post :create, {:job_post => valid_attributes}
        expect(response).to redirect_to(JobPost.last)
      end
    end
  
    describe "with invalid params" do
      it "assigns a newly created but unsaved job_post as @job_post" do
        post :create, {:job_post => invalid_attributes}
        expect(assigns(:job_post)).to be_a_new(JobPost)
      end
  
      it "re-renders the 'new' template" do
        post :create, {:job_post => invalid_attributes}
        expect(response).to render_template("new")
      end
    end
  end
  
  describe "PUT update" do
    describe "with valid params" do
      let(:new_attributes) {
        { :title => "New Developer",
          :description => "New job Description text",
          :date => Date.today,
        }
      }
  
      it "updates the requested job_post" do
        job_post = subject.current_user.job_posts.create! valid_attributes
        put :update, {:id => job_post.to_param, :job_post => new_attributes}
        job_post.reload
        expect(job_post.title).to eq("New Developer")
        expect(job_post.description).to eq("New job Description text")
      end
  
      it "assigns the requested job_post as @job_post" do
        job_post = subject.current_user.job_posts.create! valid_attributes
        put :update, {:id => job_post.to_param, :job_post => valid_attributes}
        expect(assigns(:job_post)).to eq(job_post)
      end
  
      it "redirects to the job_post" do
        job_post = subject.current_user.job_posts.create! valid_attributes
        put :update, {:id => job_post.to_param, :job_post => valid_attributes}
        expect(response).to redirect_to(job_post)
      end
    end
  
    describe "with invalid params" do
      it "assigns the job_post as @job_post" do
        job_post = subject.current_user.job_posts.create! valid_attributes
        put :update, {:id => job_post.to_param, :job_post => invalid_attributes}
        expect(assigns(:job_post)).to eq(job_post)
      end
  
      it "re-renders the 'edit' template" do
        job_post = subject.current_user.job_posts.create! valid_attributes
        put :update, {:id => job_post.to_param, :job_post => invalid_attributes}
        expect(response).to render_template("edit")
      end
    end
  end
  
  describe "DELETE destroy" do
    it "destroys the requested job_post" do
      job_post = subject.current_user.job_posts.create! valid_attributes
      expect {
        delete :destroy, {:id => job_post.to_param}
      }.to change(JobPost, :count).by(-1)
    end
  
    it "redirects to the job_posts list" do
      job_post = subject.current_user.job_posts.create! valid_attributes
      delete :destroy, {:id => job_post.to_param}
      expect(response).to redirect_to(job_posts_url)
    end
  end
end
