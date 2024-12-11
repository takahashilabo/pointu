class TransactionsController < ApplicationController
  def index
    # Get the year and month from the parameters (defaults to current year and month)
    @year = params[:year] || Time.now.year
    @month = params[:month] || Time.now.month

    # Set the start and end date for the current month (ensure to use .to_date to avoid time issues)
    start_date = Date.new(@year.to_i, @month.to_i, 1)
    end_date = start_date.end_of_month

    # Fetch expenses for the selected month and ensure the date is truncated to remove time component
    @expenses = Expense.where(date: start_date.beginning_of_day..end_date.end_of_day)

    # Group expenses by date (using .to_date to make sure time part is ignored)
    @expenses_by_date = @expenses.group_by { |expense| expense.date.to_date }

    # Calculate the total balance: sum expenses amounts
    @total_balance = @expenses.sum(&:amount)
  end
end
