class TransactionsController < ApplicationController

  def new
    @formats = TransactionParser.formats
  end

  def create
    if params[:file]
      
      
    else
      render('new')
    end
  end

end
