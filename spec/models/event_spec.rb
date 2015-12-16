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
end

	