# == Schema Information
#
# Table name: budgets
#
#  id         :bigint           not null, primary key
#  date       :date
#  month      :string
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_budgets_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Budget < ApplicationRecord
    belongs_to :user
    has_many :categories, dependent: :destroy
end
