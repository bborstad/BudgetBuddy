class AddBudgetFkColToGroups < ActiveRecord::Migration[6.0]
  def change
    add_reference :groups, :budget, foreign_key: true
  end
end
