require "test_helper"

class PreferenceTest < ActiveSupport::TestCase
  test "daily_expense_estimate should not be blank and hast to be greater than 0" do
    daily_estimate = Preference.new(daily_expense_estimate: 0)
    assert_not daily_estimate.save
  end
end
