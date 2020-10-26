class AddAttachtypeToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :attachtype, :integer, default:0
  end
end
