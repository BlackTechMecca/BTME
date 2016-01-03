require 'rails_helper'

RSpec.describe "full_profiles/edit", :type => :view do
  before(:each) do
    @full_profile = assign(:full_profile, FullProfile.create!())
  end

  it "renders the edit full_profile form" do
    render

    assert_select "form[action=?][method=?]", full_profile_path(@full_profile), "post" do
    end
  end
end
