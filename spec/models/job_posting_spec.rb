require 'rails_helper'

RSpec.describe JobPosting, :type => :model do

  let(:user) { FactoryGirl.create(:user, :first_name => "Jack") }
  let(:job_posting) do
    JobPosting.create(:user => user,
      :title => "Software Engineer",
      :description => "Build great software"
    )
  end

  it "has a title and description" do
    expect(job_posting.title).to eq("Software Engineer")
    expect(job_posting.description).to eq("Build great software")
    expect(job_posting.user).to be_a User 
    expect(job_posting.user.first_name).to eq "Jack"

  end

  describe "validations" do
    it "validates that it is associated with a user" do
      invalid_post = JobPosting.create(:title => "Employee wanted",
                                       :description => "To do stuff!")
      expect(invalid_post).to_not be_valid
    end

    it "validates that it has a title" do
      invalid_post = JobPosting.create(:user => FactoryGirl.create(:user),
                                       :description => "To do stuff!")
      expect(invalid_post).to_not be_valid
    end

    it "validates that it has a description" do
      invalid_post = JobPosting.create(:title => "Employee wanted",
                                       :user => FactoryGirl.create(:user))
      expect(invalid_post).to_not be_valid
    end
  end

  it "creates a an associated activity" do
    expect(job_posting.activity).to be_an Activity
  end

  describe "#preview" do
    it "displays the title and start of description" do
      expect(job_posting.preview).to eq("Software Engineer - Build great soft... (posted by Jack)")
    end
  end
end
