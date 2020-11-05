class Fixattachid < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :attachid, :goalid
  end
end
