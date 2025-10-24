class Preference < ApplicationRecord
  validates :daily_expense_estimate, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :initial_balance, numericality: { greater_than_or_equal_to: 0 }
end
