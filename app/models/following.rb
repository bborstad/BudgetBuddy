# == Schema Information
#
# Table name: followings
#
#  id                :bigint           not null, primary key
#  tfalse            :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  following_user_id :bigint
#  requester_user_id :bigint
#  user_id           :bigint
#
# Indexes
#
#  index_followings_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Following < ApplicationRecord
    belongs_to(
        :user,
        class_name: 'User',
        foreign_key: 'user_id',
        inverse_of: :followings
    )
end
