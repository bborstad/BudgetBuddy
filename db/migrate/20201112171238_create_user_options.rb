class CreateUserOptions < ActiveRecord::Migration[6.0]
  def change
    create_table :user_options do |t|
      t.integer :budget_id, default:0

      t.timestamps
    end
  end
end
