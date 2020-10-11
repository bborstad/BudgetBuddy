class AddGroupFkColToCategories < ActiveRecord::Migration[6.0]
  def change
    add_reference :categories, :group, foreign_key: true
  end
end
