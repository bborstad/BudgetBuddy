class AddPPercentToGoals < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :ppercent, :decimal
  end
end
