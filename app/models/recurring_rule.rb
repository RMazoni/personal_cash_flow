class RecurringRule < ApplicationRecord
  validates :description, :amount, :kind, :month_day, presence: true
  validates :month_day, inclusion: { in: 1..31 }
  validates :kind, inclusion: { in: [ "fixed_income", "fixed_expense" ] }
  validates :description, length: { maximum: 50 }
end
