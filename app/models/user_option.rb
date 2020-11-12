# == Schema Information
#
# Table name: user_options
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  budget_id  :integer          default(0)
#  user_id    :bigint
#
# Indexes
#
#  index_user_options_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class UserOption < ApplicationRecord
    belongs_to(
        :user,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :user_options
    )
end
