class Preference < ApplicationRecord
  validates :daily_expense_estimate, presence: true, numericality: { greater_than: 0 }
  validates :initial_balance, numericality: { greater_than: 0 }
end
