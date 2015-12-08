class EventsController < ApplicationController
	
	def index
		@events = Events.all
	end

	def show
		@event = Event.find(params[:id])
	end


end