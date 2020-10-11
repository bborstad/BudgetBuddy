class CreateBudgets < ActiveRecord::Migration[6.0]
  def change
    create_table :budgets do |t|
      t.date :date, default: -> { 'CURRENT_DATE' }
      t.month :month, 
      t.timestamps
    end
  end
end
