require 'rails_helper'

RSpec.describe "full_profiles/show", :type => :view do
  before(:each) do
    @full_profile = assign(:full_profile, FullProfile.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
