class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.float :average, :default => 0.0
      t.float :categories_sum, :default => 0.0
      t.timestamps
    end
  end
end
