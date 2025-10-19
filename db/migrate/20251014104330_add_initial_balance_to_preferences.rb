class AddInitialBalanceToPreferences < ActiveRecord::Migration[8.0]
  def change
    add_column :preferences, :initial_balance, :decimal
  end
end
