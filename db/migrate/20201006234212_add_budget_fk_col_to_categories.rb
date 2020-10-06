class AddBudgetFkColToCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories, :budget, foreign_key: true
  end
end
