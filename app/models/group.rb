# == Schema Information
#
# Table name: groups
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  budget_id  :bigint
#
# Indexes
#
#  index_groups_on_budget_id  (budget_id)
#
# Foreign Keys
#
#  fk_rails_...  (budget_id => budgets.id)
#
class Group < ApplicationRecord
    belongs_to(
        :budget,
        class_name: 'Budget',
        foreign_key: 'budget_id',
        inverse_of: :groups
    )

    has_many(
        :categories,
        class_name: 'Category',
        foreign_key: 'group_id',
        inverse_of: :groups
    )

    validates :name, presence: true, uniqueness: true
end
