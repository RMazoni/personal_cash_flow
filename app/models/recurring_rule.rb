class RecurringRule < ApplicationRecord
  validates :description, :amount, :kind, :month_day, presence: true
  validates :month_day, inclusion: { in: 1..31 }
  validates :kind, inclusion: { in: [ "Income", "Fixed Expense", "Daily Expense" ] }
  validates :description, length: { maximum: 50 }

  def generate_future_transactions
    12.times do |i|
      target_month = Date.today + (i + 1).month
      test_date = Date.new(target_month.year, target_month.month, self.month_day)
      if test_date.month == target_month.month
        final_date = test_date
      else
        final_date = target_month.end_of_month
      end

      Transaction.create!(
        date: final_date,
        amount: self.amount,
        description: self.description,
        kind: self.kind
      )
    end
  end
end
