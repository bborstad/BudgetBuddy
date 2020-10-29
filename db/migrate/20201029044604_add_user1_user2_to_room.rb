class AddUser1User2ToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :user1, :integer
    add_column :rooms, :user2, :integer
  end
end
