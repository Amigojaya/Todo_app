class QuotesController < ApplicationController
  before_action :authenticate_user!
  def index
    @quotes = Quote.all.where(status: "approved")
    @random = Quote.order("RANDOM()").where(status: "approved").limit(10)
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.create(quote_params_good)
    if @quote.save 
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    if current_user.admin
      @quote = Quote.find(params[:id])
    else
      redirect_to quotes_path
    end
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update(quote_params_good)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    redirect_to quotes_path
  end

  private 

  def quote_params_good
    params.require(:quote).permit(:quotes, :author, :user_id)
  end
end
