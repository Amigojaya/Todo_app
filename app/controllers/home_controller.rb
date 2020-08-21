class HomeController < ApplicationController
before_action :authenticate_user!, except: [:index]
  def index
  	if current_user
  		redirect_to dashboard_path
  	end
  end

  def dashboard
  	
  end

  def download_pdf
  	send_file 'public/daddy.pdf', type: 'application/pdf'
  end 

end
