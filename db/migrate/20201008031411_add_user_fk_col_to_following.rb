class AddUserFkColToFollowing < ActiveRecord::Migration[6.0]
  def change
    add_reference :followings, :user, foreign_key: true
  end
end
