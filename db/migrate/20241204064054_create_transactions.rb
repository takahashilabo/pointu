class CreateTransactions < ActiveRecord::Migration[7.2]
  def change
    create_table :transactions do |t|
      t.date :date
      t.string :description
      t.integer :amount
      t.string :category
      t.string :transaction_type

      t.timestamps
    end
  end
end
