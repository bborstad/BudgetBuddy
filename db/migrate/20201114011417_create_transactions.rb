class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.float :amount
      t.date :date
      t.string :source

      t.timestamps
    end
  end
end
