# == Schema Information
#
# Table name: goals
#
#  id         :bigint           not null, primary key
#  goal       :float
#  progress   :float            default(0.0)
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_goals_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Goal < ApplicationRecord
    belongs_to(
        :user,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :goals
    )
    validates :goal, numericality: {greater_than_or_equal_to: 0}
    validates :progress, numericality: {greater_than_or_equal_to: 0}


end
