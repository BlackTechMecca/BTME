require 'rails_helper'

RSpec.describe "job_posts/index", :type => :view do
  before(:each) do
    assign(:job_posts, [
      JobPost.create!(
        :title => "MyText",
        :description => "MyText",
        :references => ""
      ),
      JobPost.create!(
        :title => "MyText",
        :description => "MyText",
        :references => ""
      )
    ])
  end

  it "renders a list of job_posts" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
