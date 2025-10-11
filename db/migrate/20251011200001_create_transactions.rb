class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.date :date
      t.decimal :amount
      t.string :description
      t.string :kind

      t.timestamps
    end
  end
end
