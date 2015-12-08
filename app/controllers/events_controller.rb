class EventsController < ApplicationController

	def index
		p "************************************************************"
		p "************************************************************"
		p "************************************************************"
		@events = Event.all
		p @events
	end

	def show
		@event = Event.find(params[:id])
	end


end