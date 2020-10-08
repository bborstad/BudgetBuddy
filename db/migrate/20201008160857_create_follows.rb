class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.bigint :requestor
      t.bigint :following

      t.timestamps
    end
  end
end
