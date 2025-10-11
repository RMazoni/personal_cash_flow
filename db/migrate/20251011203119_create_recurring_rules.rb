class CreateRecurringRules < ActiveRecord::Migration[8.0]
  def change
    create_table :recurring_rules do |t|
      t.string :description
      t.decimal :amount
      t.string :kind
      t.integer :month_day

      t.timestamps
    end
  end
end
