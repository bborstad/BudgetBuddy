class CreateRetirements < ActiveRecord::Migration[6.0]
  def change
    create_table :retirements do |t|
      t.integer :start_amount
      t.integer :retire_by
      t.float :intrest
      t.decimal :annual_saving

      t.timestamps
    end
  end
end
