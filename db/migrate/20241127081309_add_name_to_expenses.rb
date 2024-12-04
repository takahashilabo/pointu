class AddNameToExpenses < ActiveRecord::Migration[7.2]
  def change
    add_column :expenses, :name, :string
  end
end
