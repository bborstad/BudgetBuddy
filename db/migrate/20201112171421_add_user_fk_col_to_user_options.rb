class AddUserFkColToUserOptions < ActiveRecord::Migration[6.0]
  def change
    add_reference :user_options, :user, foreign_key: true
  end
end
