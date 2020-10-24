class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.float :average, :default => 0.00
      t.timestamps
    end
  end
end
