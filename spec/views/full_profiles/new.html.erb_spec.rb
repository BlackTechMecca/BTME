require 'rails_helper'

RSpec.describe "full_profiles/new", :type => :view do
  before(:each) do
    assign(:full_profile, FullProfile.new())
  end

  it "renders new full_profile form" do
    render

    assert_select "form[action=?][method=?]", full_profiles_path, "post" do
    end
  end
end
