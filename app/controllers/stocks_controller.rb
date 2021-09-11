class StocksController < ApplicationController
  before_action :check_String

  def search
    @stock = Stock.new_lookup(params[:stock].upcase)
    if @stock.nil?
      flash[:alert] = "Please enter a valid Stock symbol to search"
      redirect_to my_portfolio_path
    else
      respond_to do |format|
        format.js {render partial: 'users/result'}
      end
    end
  end

  private
  def check_String
    if params[:stock].empty?
      flash[:alert] = 'Please Enter a symbol to search!'
      redirect_to my_portfolio_path
    end
  end
end
