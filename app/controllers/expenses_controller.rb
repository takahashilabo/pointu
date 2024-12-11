class ExpensesController < ApplicationController
  before_action :set_expense, only: [:edit, :update]

  # New Expense Form
  def new
    @expense = Expense.new
  end

  # Create a new expense
  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      # Redirect to the transactions index page after successful creation
      redirect_to transactions_path, notice: 'Expense added successfully.'
    else
      render :new
    end
  end

  # Edit Expense Form
  def edit
    # @expense is already set by before_action
  end

  # Update an existing expense
  def update
    if @expense.update(expense_params)
      # Redirect to the transactions index page after successful update
      redirect_to transactions_path, notice: 'Expense updated successfully.'
    else
      render :edit
    end
  end

  private

  # Set the expense for edit and update actions
  def set_expense
    @expense = Expense.find(params[:id])
  end

  # Strong parameters for expense
  def expense_params
    params.require(:expense).permit(:name, :amount, :date, :description)
  end
end
