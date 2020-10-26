# == Schema Information
#
# Table name: personal_messages
#
#  id              :bigint           not null, primary key
#  body            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  conversation_id :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_personal_messages_on_conversation_id  (conversation_id)
#  index_personal_messages_on_user_id          (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (conversation_id => conversations.id)
#  fk_rails_...  (user_id => users.id)
#
class PersonalMessage < ApplicationRecord
  belongs_to :conversation
  belongs_to :user
  validates :body, presence: true

  after_create_commit do
    NotificationBroadcastJob.perform_later(self)
  end
  

end
