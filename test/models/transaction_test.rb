require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  test "date, amount and kind should not be blank" do
    transaction = Transaction.new
    assert_not transaction.save
  end

  test "amount must be positive number" do
    transaction = transactions(:one).dup
    transaction.amount = -1
    assert_not transaction.save
  end

  test "description should be 50 characters maximum" do
    transaction = transactions(:one).dup
    transaction.description = "Aluguel econdomínio no edifício residencial alto da montanha"
    assert_not transaction.save
  end

  test "kind is restricted to income, fixed_expense and daily_expense" do
    transaction = transactions(:one).dup
    transaction.kind = "food"
    assert_not transaction.save
  end
end
