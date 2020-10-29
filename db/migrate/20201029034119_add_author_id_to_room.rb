class AddAuthorIdToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :author_id, :integer
    add_index :rooms, :author_id
    add_column :rooms, :receiver_id, :integer
    add_index :rooms, :receiver_id
  end
end
