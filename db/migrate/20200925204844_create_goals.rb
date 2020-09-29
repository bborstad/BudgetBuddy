class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.string :title
      t.integer :progress
      t.integer :goal

      t.timestamps
    end
  end
end