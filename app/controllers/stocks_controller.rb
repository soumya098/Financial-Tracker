class StocksController < ApplicationController
  before_action :check_String, only: [:search]

  def search
    @stock = Stock.new_lookup(params[:stock].upcase)
    if @stock.nil?
      respond_to do |format|
        flash.now[:alert] = "Please enter a valid Stock symbol to search"
        format.js {render partial: 'users/alert'}
      end
    else
      respond_to do |format|
        format.js {render partial: 'users/result'}
      end
    end
  end
  
  private
  def check_String
    if params[:stock].empty?
      respond_to do |format|
        flash.now[:alert] = 'Please Enter a symbol to search!'
        format.js {render partial: 'users/alert'}
      end
    end
  end
end
