require 'rails_helper'

RSpec.describe Event, :type => :model do 
	let(:user) {FactoryGirl.create(:user, :first_name => "Sam", :last_name => "Smith")}
	let(:event) do 
		Event.create(name: "Chi-hacknight",
					description: "Something will happen, hopefully",
					user: user)
	end


	describe '#initialize' do 

		it 'should have a title and descrpiton' do 
			expect(event.name).to eq("Chi-hacknight")
		end

		it 'belongs to a user' do 
			expect(event.user).to be_a User
			expect(event.user.first_name).to eq "Sam"
		end

		xit 'create an associated activity' do 
			expect(event.activity).to be_an Activity
		end

	end




end

	