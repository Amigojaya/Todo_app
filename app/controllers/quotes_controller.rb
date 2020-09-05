class QuotesController < ApplicationController
  before_action :authenticate_user!
  def index
    @quotes = Quote.all.where(status: "approved").order(:id)
    @random = Quote.order("RANDOM()").where(status: "approved").limit(6)
  end

  def new
    @quote = Quote.new
  end

  def user
    @random = Quote.order("RANDOM()").where(status: "approved").limit(6)
    if current_user.admin
      @pending = current_user.quotes.where(status: "pending").order(:id)
    else
      @pending = current_user.quotes.order(:id)
    end
    @count_approve = Quote.all.where(status: "approved").count.to_s
    @filter = "Click to view all " + @count_approve + " Quotes"
  end

  def create
    @quote = Quote.create(quote_params_good)
    if @quote.save
      if !current_user.admin
        TestMailer.alert_admin(current_user, @quote).deliver_now 
      end
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

  def admin
    if current_user.admin
      @quotes = Quote.all.order(:id)
      @pending = Quote.where(status: "pending").order(:id)
    else
      redirect_to quotes_path
    end
  end

  def update
    @quote = Quote.find(params[:id])
    if @quote.update(admin_edit)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @quote = Quote.find(params[:id])
    @quote.destroy
    if current_user.admin
      redirect_to admin_quote_path
      else
      redirect_to quotes_path
    end
  end

  private 

  def quote_params_good
    params.require(:quote).permit(:quotes, :author, :user_id, :status)
  end
  def admin_edit
    params.require(:quote).permit(:quotes, :author, :status)
  end
end
