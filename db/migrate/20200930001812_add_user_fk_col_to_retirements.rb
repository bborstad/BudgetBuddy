class AddUserFkColToRetirements < ActiveRecord::Migration[6.0]
  def change
    add_reference :retirements, :user, foreign_key: true
  end
end
