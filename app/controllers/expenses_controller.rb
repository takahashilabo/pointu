class ExpensesController < ApplicationController
  def index
    @expenses = Expense.all.group_by(&:date)
  end
end
