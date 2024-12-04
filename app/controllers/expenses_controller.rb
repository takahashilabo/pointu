class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    if @expense.save
      redirect_to expenses_path, notice: '収支が追加されました'
    else
      render :new
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :date, :description)
  end
end
