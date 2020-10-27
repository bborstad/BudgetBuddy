class AddAttachidToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :attachid, :integer, default:0
  end
end
