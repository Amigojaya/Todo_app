class EmailSubscribesController < ApplicationController
	
	def email_subscribe
		@email = EmailSubscribe.new
	end

	def email_subscribe_post
		@email = EmailSubscribe.exists?(email: params[:email]) rescue nil
		
		if !@email
			if !User.exists?(email: params[:email])
				 new_sub = EmailSubscribe.new
				 new_sub.email = params[:email]
				 if new_sub.save
				 	redirect_to root_path, success: "Successfully Added you email to Daily Quotation Gang" 
				 else
				 	redirect_to root_path, danger: "Something went wrong Here"
				 end  
			else
				redirect_to root_path, danger: "No need Amigo, You already have Account in our App"
			end 
		else
			redirect_to root_path, danger: "You have already Subscribed"
		end
	end
end