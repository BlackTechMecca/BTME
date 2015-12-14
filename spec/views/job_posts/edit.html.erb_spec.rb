require 'rails_helper'

RSpec.describe "job_posts/edit", :type => :view do
  before(:each) do
    @job_post = assign(:job_post, JobPost.create!(
      :title => "MyText",
      :description => "MyText",
      :references => ""
    ))
  end

  it "renders the edit job_post form" do
    render

    assert_select "form[action=?][method=?]", job_post_path(@job_post), "post" do

      assert_select "textarea#job_post_title[name=?]", "job_post[title]"

      assert_select "textarea#job_post_description[name=?]", "job_post[description]"

      assert_select "input#job_post_references[name=?]", "job_post[references]"
    end
  end
end
