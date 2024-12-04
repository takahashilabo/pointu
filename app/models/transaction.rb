class Transaction < ApplicationRecord
  validates :date, presence: true
  validates :description, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :category, presence: true
  validates :transaction_type, presence: true, inclusion: { in: ['Income', 'Expense'] }
end
