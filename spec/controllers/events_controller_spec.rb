require 'rails_helper'

RSpec.describe EventsContoller, :type => :controller do 
	describe '#index' do 
		it 'displays all events' do 
			10.times {FactoryGirl.create(:event)}
			get :index

			expect(response.status).to be 200
		end
	end
end