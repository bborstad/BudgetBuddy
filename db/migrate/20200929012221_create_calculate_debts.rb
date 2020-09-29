class CreateCalculateDebts < ActiveRecord::Migration[6.0]
  def change
    create_table :calculate_debts do |t|
      t.decimal :principle
      t.decimal :rate
      t.decimal :monthly_payements
      t.integer :compounds_per_year
      t.integer :number_of_year
      t.string :email
      t.integer :select

      t.timestamps
    end
  end
end
