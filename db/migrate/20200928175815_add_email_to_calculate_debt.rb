class AddEmailToCalculateDebt < ActiveRecord::Migration[6.0]
  def change
    add_column :calculate_debts, :email, :string
  end
end
