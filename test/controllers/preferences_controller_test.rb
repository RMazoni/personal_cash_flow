require "test_helper"

class PreferencesControllerTest < ActionDispatch::IntegrationTest
  test "should update preferences" do
    Preference.create!(initial_balance: 0, daily_expense_estimate: 0)
    patch preference_url, params: {
      preference: {
        initial_balance: "1000",
        daily_expense_estimate: "100"
      }
    }
    updated_preference = Preference.first
    assert_equal 1000, updated_preference.initial_balance
    assert_equal 100, updated_preference.daily_expense_estimate
  end
end
