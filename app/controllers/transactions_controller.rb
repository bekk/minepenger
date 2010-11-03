class TransactionsController < ApplicationController

  def new
    @formats = TransactionParser.formats
  end

  def create
    if params[:file]
      render :text => params.inspect      
      
    else
      @formats = TransactionParser.formats
      render('new')
    end
  end

end
