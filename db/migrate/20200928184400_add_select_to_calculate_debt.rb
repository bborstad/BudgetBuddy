class AddSelectToCalculateDebt < ActiveRecord::Migration[6.0]
  def change
    add_column :calculate_debts, :select, :integer
  end
end
