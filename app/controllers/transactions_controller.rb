class TransactionsController < ApplicationController
  def index
    # Get the year and month from the parameters (defaults to current year and month)
    @year = params[:year] || Time.now.year
    @month = params[:month] || Time.now.month

    # Set the start and end date for the current month
    start_date = Date.new(@year.to_i, @month.to_i, 1)
    end_date = start_date.end_of_month

    # Fetch transactions for the selected month
    @transactions = Transaction.where(date: start_date..end_date)

    # Calculate the total balance: sum incomes and subtract expenses
    @total_balance = @transactions.sum do |transaction|
      transaction.transaction_type == 'Income' ? transaction.amount : -transaction.amount
    end
  end
end
