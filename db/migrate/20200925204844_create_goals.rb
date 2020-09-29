class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :title
      t.float :progress
      t.float :goal

      t.timestamps
    end
  end
end
