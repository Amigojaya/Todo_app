class EmailSubscribesController < ApplicationController
	
	def email_subscribe_get
		@email = EmailSubscribe.new
	end

	def email_subscribe_post
		@email = EmailSubscribe.exists?(email: params[:email]) rescue nil
		
		if !@email 
			if !User.exists?(email: params[:email]) 
				 new_sub = EmailSubscribe.new(email_params)
				 if verify_recaptcha(model: @user) && new_sub.save
				 	redirect_to root_path, success: "Successfully Added you email to Daily Quotation Gang" 
				 elsif !params[:email].present?
				 	redirect_to root_path, danger: "Email can't be blank or Please enter a valid Email"
				 else
				 	redirect_to root_path, danger: "Something went wrong"
				 end  
			else
				redirect_to root_path, danger: "No need Amigo, You already have Account in our App"
			end 
		else
			redirect_to root_path, danger: "You have already Subscribed"
		end
	end

	private 
	
	def email_params
	    params.require(:email_subscribe).permit(:email)
	  end
end