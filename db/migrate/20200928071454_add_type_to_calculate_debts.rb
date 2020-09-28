class AddTypeToCalculateDebts < ActiveRecord::Migration[6.0]
  def change
    add_column :calculate_debts, :type, :string
  end
end
