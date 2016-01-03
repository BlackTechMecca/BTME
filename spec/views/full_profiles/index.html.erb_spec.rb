require 'rails_helper'

RSpec.describe "full_profiles/index", :type => :view do
  before(:each) do
    assign(:full_profiles, [
      FullProfile.create!(),
      FullProfile.create!()
    ])
  end

  it "renders a list of full_profiles" do
    render
  end
end
