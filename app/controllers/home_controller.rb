class HomeController < ApplicationController
before_action :authenticate_user!, except: [:index]
  def index
  	if current_user
  		redirect_to user_tasks_path
  	end
  end

  def dashboard
  	
  end

  

end
