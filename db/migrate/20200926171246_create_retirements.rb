class CreateRetirements < ActiveRecord::Migration[6.0]
  def change
    create_table :retirements do |t|
      t.decimal :start_amount
      t.integer :time_until_retirement
      t.decimal :annual_savings
      t.float :intrest_rate
      t.decimal :retirement_estimate

      t.timestamps
    end
  end
end
