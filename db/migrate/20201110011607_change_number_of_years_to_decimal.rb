class ChangeNumberOfYearsToDecimal < ActiveRecord::Migration[6.0]
  def change
    change_column :calculate_debts, :number_of_year, :decimal
  end
end
