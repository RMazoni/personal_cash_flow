class Transaction < ApplicationRecord
  validates :date, :amount, :kind, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  validates :description, length: { maximum: 50 }
  validates :kind, inclusion: { in: [ "income", "fixed_expense", "daily_expense" ] }
end
