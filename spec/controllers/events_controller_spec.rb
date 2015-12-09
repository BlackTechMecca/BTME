require 'rails_helper'

RSpec.describe EventsController, :type => :controller do 
	describe '#index' do 
		it 'displays all events' do 
			10.times {FactoryGirl.create(:event)}
			get :index

			expect(response.status).to be 200
			event_hits = assigns(:events)
			expect(event_hits.count).to eq(10)
		end
	end
end