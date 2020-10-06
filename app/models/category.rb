# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  actual     :float
#  grouping   :string
#  name       :string
#  projected  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  budget_id  :bigint
#
# Indexes
#
#  index_categories_on_budget_id  (budget_id)
#
# Foreign Keys
#
#  fk_rails_...  (budget_id => budgets.id)
#
class Category < ApplicationRecord
    belongs_to :budget
end
