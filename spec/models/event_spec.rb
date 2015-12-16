require 'rails_helper'

RSpec.describe Event, :type => :model do 
	let(:user) {FactoryGirl.create(:user, :first_name => "Sam", :last_name => "Smith")}
	let(:event) {FactoryGirl.create(:event, :name=>"Chi-hacknight",:description => "A place where stuff happens",:user=>user)}

	describe '#initialize' do 
		it '#initialize should set that proper characteristics' do 
			expect(event.name).to eq("Chi-hacknight")
			expect(event.description).to eq("A place where stuff happens")
			expect(event.user).to be_a User
		end

		it 'create an associated activity' do 
			expect(event.activity).to be_a Activity
		end
	end


	describe 'validations' do 
		it 'validates that it has a user' do 
			invalid_event = Event.create(name:"A presentation",description:"some some")
			expect(invalid_event).to_not be_valid
		end

		it 'validates that it has a name' do 
			invalid_event = Event.create(description:"something more",user:FactoryGirl.create(:user))
			expect(invalid_event).to_not be_valid
		end

	end


end

	