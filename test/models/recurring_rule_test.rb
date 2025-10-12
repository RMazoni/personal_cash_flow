require "test_helper"

class RecurringRuleTest < ActiveSupport::TestCase
  test "description, amount, kind and month_day should not be blank" do
    recurring = RecurringRule.new
    assert_not recurring.save
  end

  test "month_day can only be between 1 and 31" do
    recurring = recurring_rules(:one).dup
    recurring.month_day = 32
    assert_not recurring.save
  end

  test "description should be 50 characters maximum" do
    recurring = recurring_rules(:one).dup
    recurring.description = "Aluguel econdomínio no edifício residencial alto da montanha"
    assert_not recurring.save
  end

  test "kind can only be Income, Fixed Expense or Daily Expense" do
    recurring = recurring_rules(:one).dup
    recurring.kind = "food"
    assert_not recurring.save
  end

  test "generate 12 transactions after new recurring rule is created" do
    rule = recurring_rules(:one).dup
    initial_count = Transaction.count
    rule.generate_future_transactions
    assert_equal initial_count + 12, Transaction.count

    new_transactions = Transaction.last(12)
    new_transactions.each do |transaction|
      assert_equal rule.description, transaction.description
      assert_equal rule.amount, transaction.amount
      assert_equal rule.kind, transaction.kind
    end

    # in case the day_of_month chose does not exist in 'short' months:
    short_months = [ 4, 6, 9, 11 ]
    february = 2

    Transaction.all.each do |t|
      if short_months.include?(t.date.month)
        assert t.date.day <= 30, "Transaction in short months should not have day 31"
      elsif t.date.month == february
        assert t.date.day <= 29, "Transaction in february should not have more than 29 days"
      end
    end
  end
end
