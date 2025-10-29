class RecurringRule < ApplicationRecord
  validates :description, :amount, :kind, :month_day, presence: true
  validates :month_day, inclusion: { in: 1..31 }
  validates :kind, inclusion: { in: [ "Fixed Income", "Fixed Expense" ] }
  validates :description, length: { maximum: 50 }
end
