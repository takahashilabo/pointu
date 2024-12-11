class TransactionsController < ApplicationController
  def index
    # Get the year and month from the parameters (defaults to current year and month)
    @year = params[:year] || Time.now.year
    @month = params[:month] || Time.now.month

    # Set the start and end date for the current month (ensure to use .to_date to avoid time issues)
    start_date = Date.new(@year.to_i, @month.to_i, 1)
    end_date = start_date.end_of_month

    # Fetch transactions for the selected month and ensure the date is truncated to remove time component
    @transactions = Transaction.where(date: start_date.beginning_of_day..end_date.end_of_day)

    # Group transactions by date (using .to_date to make sure time part is ignored)
    @transactions_by_date = @transactions.group_by { |t| t.date.to_date }

    # Calculate the total balance: sum incomes and subtract expenses
    @total_balance = @transactions.sum do |transaction|
      transaction.transaction_type == 'Income' ? transaction.amount : -transaction.amount
    end
  end
end
