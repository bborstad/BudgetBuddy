class CreateRetirements < ActiveRecord::Migration[6.0]
  def change
    create_table :retirements do |t|
      t.decimal :annual_savings
      t.integer :year_of_retirement
      t.decimal :inital_savings
      t.float :intrest_rate
      t.decimal :retirement_estimate

      t.timestamps
    end
  end
end
