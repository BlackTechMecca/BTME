require 'mailchimp'

class SubscribersController < ApplicationController

	before_action :setup_mcapi

	def setup_mcapi
  		@mc = Mailchimp::API.new('b023f41df72436528a3f4edaa604b237-us11')
  	end

	def create
		@subscriber = Subscriber.new(subscriber_params)
		if @subscriber.save
			newsletter_id = '71480d5182'
			email = @subscriber.email
			begin
				@mc.lists.subscribe(newsletter_id, {'email' => email})
			rescue Mailchimp::ListDoesNotExistError
				flash[:danger] = "Oops. Something went wrong. Please try again later."
				render '/home/index'
			return
			rescue Mailchimp::Error => ex
			if ex.message
				flash[:danger] = ex.message
			else
				flash[:danger] = "Oops. Something went wrong. Please try again later."
			end
		end
			flash[:success] = "Thank you, your sign-up request was successful! Please check your e-mail inbox."
			render 'home/index'
		else
			flash[:danger] = "Something went wrong"
			render 'home/index'
		end
	end


private

	def subscriber_params
		params.require(:subscriber).permit(:email, :location)
	end
end
