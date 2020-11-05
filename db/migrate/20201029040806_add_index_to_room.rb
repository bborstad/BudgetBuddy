class AddIndexToRoom < ActiveRecord::Migration[6.0]
  def change
    add_index :rooms, [:author_id, :receiver_id], unique: true
  end
end
