# == Schema Information
#
# Table name: groups
#
#  id         :bigint           not null, primary key
#  average    :float            default(0.0)
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
require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
