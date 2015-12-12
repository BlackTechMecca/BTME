require 'rails_helper'

RSpec.describe "job_posts/show", :type => :view do
  before(:each) do
    @job_post = assign(:job_post, JobPost.create!(
      :title => "MyText",
      :description => "MyText",
      :references => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
