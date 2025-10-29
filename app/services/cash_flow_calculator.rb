class CashFlowCalculator
  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def call
    all_days = []
    setting = Preference.first_or_create!(initial_balance: 0, daily_expense_estimate: 0)
    recurring_rules = RecurringRule.all
    all_transactions = Transaction.where(date: @start_date..@end_date)
    transactions_grouped_by_date = all_transactions.group_by(&:date)

    current_balance = setting.initial_balance
    daily_expense_estimate = setting.daily_expense_estimate

    (@start_date..@end_date).each do |current_date|
      total_income = 0
      total_fixed_expense = 0
      total_daily_expense = 0
      current_day_transactions_list = transactions_grouped_by_date[current_date] || []
      current_day_transactions_list.each do |transaction|
        if transaction.kind == "income"
          total_income += transaction.amount
        elsif transaction.kind == "Fixed Expense"
          total_fixed_expense += transaction
        elsif transaction.kind == "Daily Expense"
          total_daily_expense += transaction.amount
        end
      end

      if total_daily_expense == 0 && current_date >= Date.current
        total_daily_expense = daily_expense_estimate
      end

      recurring_rules.each do |rule|
        if rule.month_day == current_date.day
          if rule.kind == "Fixed Income"
            total_income += rule.amount
          elsif rule.kind == "Fixed Expense"
            total_fixed_expense += rule.amount
          end
        end
      end
      daily_balance = total_income - total_fixed_expense - total_daily_expense
      current_balance += daily_balance

      all_days << {
      date: current_date,
      income: total_income,
      fixed_expense: total_fixed_expense,
      daily_expense: total_daily_expense,
      balance: current_balance
      }
    end
    all_days
  end
end
