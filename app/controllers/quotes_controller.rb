class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
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
    @quote = Quote.find(params[:id])
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
    redirect_to quuotes_path
  end

  private 

  def quote_params_good
    params.require(:quote).permit(:quotes, :author, :user_id)
  end
end
