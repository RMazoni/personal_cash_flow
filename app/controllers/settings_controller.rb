class SettingsController < ApplicationController
  def index
    @recurring_rules = RecurringRule.all
    @preference = Preference.first_or_create!
  end
end
