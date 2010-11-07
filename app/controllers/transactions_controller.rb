class TransactionsController < ApplicationController

  def index
    # Fasetteringsmulighet /transactions/2010/12
    if params[:year]
      if params[:month]
        @transactions = Transaction.where(:date => DateTime.new(params[:year].to_f, params[:month].to_f, 1)..DateTime.new(params[:year].to_f, params[:month].to_f, -1, -1))
      else
        @transactions = Transaction.where(:date => DateTime.new(params[:year].to_f, 1, 1)..DateTime.new(params[:year].to_f, -1, -1))
      end
    else
      @transactions = Transaction.all
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
