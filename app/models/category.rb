# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  actual     :float
#  name       :string
#  projected  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  group_id   :bigint
#
# Indexes
#
#  index_categories_on_group_id  (group_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#
class Category < ApplicationRecord
    belongs_to :group
end
