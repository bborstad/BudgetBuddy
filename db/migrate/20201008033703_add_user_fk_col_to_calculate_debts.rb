class AddUserFkColToCalculateDebts < ActiveRecord::Migration[6.0]
  def change
    add_reference :calculate_debt, :user, foreign_key:true
  end
end
