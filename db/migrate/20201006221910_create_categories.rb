class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.float :projected
      t.float :actual
      t.timestamps
    end
  end
end
