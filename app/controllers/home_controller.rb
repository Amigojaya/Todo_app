class HomeController < ApplicationController

  def index
  	@email = EmailSubscribe.new
  	@quote = Quote.order("RANDOM()").first
  	if current_user
  		redirect_to user_tasks_path
  	end
  end

  def dashboard
  	
  end

  def about_me
    
  end

  

end
