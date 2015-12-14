require 'rails_helper'

RSpec.describe "job_posts/new", :type => :view do
  before(:each) do
    assign(:job_post, JobPost.new(
      :title => "MyText",
      :description => "MyText",
      :references => ""
    ))
  end

  it "renders new job_post form" do
    render

    assert_select "form[action=?][method=?]", job_posts_path, "post" do

      assert_select "textarea#job_post_title[name=?]", "job_post[title]"

      assert_select "textarea#job_post_description[name=?]", "job_post[description]"

      assert_select "input#job_post_references[name=?]", "job_post[references]"
    end
  end
end
