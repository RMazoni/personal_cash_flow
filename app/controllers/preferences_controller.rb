class PreferencesController < ApplicationController

  def update
    preference = Preference.first_or_create!
    preference.update(preference_params)
    redirect_to preference
  end

  private

  def preference_params
    params.expect(preference: [ :initial_balance, :daily_expense_estimate ])
  end
end
