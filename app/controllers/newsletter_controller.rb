require 'mailchimp'

class NewsletterController < ApplicationController
	
	before_action :setup_mcapi

	def setup_mcapi
  		@mc = Mailchimp::API.new('b023f41df72436528a3f4edaa604b237-us11')
  	end
	
	def subscribe
		newsletter_id =   '71480d5182'
		email = params['email']
		begin
			@mc.lists.subscribe(newsletter_id, {'email' => email})
			flash[:success] = "Thank you, your sign-up request was successful! Please check your e-mail inbox."
		rescue Mailchimp::ListDoesNotExistError
			flash[:error] = "Oops. Something went wrong. Please try again later."
			render '/home/index'
			return
		rescue Mailchimp::Error => ex
			if ex.message
				flash[:error] = ex.message
			else
				flash[:error] = "Oops. Something went wrong. Please try again later."
			end
		end
		render '/home/index'
	end

end
