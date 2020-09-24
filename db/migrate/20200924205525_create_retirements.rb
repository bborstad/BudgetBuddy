class CreateRetirements < ActiveRecord::Migration[6.0]
  def change
    create_table :retirements do |t|

      t.timestamps
    end
  end
end
