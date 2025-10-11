class CreatePreferences < ActiveRecord::Migration[8.0]
  def change
    create_table :preferences do |t|
      t.decimal :daily_expense_estimate

      t.timestamps
    end
  end
end
