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
end
