class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @formats = TransactionParser.formats
  end

  def create
    if params[:file]
      parser = TransactionParser::Formats.const_get(params[:format])
      transactions = parser.parse(params[:file])

      transactions.each do |t|
        transaction = Transaction.new(t)
        transaction.account_id = Account.where({:name => params[:account]}).first.id
        transaction.user_id = session[:user_id]
        transaction.save
      end

      redirect_to transactions_path
    else
      render('new')
    end
  end

end
