class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.bigint :requester_user_id
      t.bigint :following_user_id
      t.boolean :tfalse

      t.timestamps
    end
  end
end
