class AddBudgetidToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :budgetid, :integer, default:0
  end
end
