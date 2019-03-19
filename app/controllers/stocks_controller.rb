class StocksController < ApplicationController

  def search
    if params[:stock].blank?
      flash.now[:danger] = "You have entered an empty gape. Please enter some information"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "Invalid symbol. Try a valid one" unless @stock
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end
end