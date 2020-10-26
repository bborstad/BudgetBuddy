# == Schema Information
#
# Table name: conversations
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :integer
#  receiver_id :integer
#
# Indexes
#
#  index_conversations_on_author_id                  (author_id)
#  index_conversations_on_author_id_and_receiver_id  (author_id,receiver_id) UNIQUE
#  index_conversations_on_receiver_id                (receiver_id)
#
class Conversation < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :receiver, class_name: 'User'
    validates :author, uniqueness: {scope: :receiver}
    has_many :personal_messages, -> { order(created_at: :asc) }, dependent: :destroy

    scope :participating, -> (user) do
        where("(conversations.author_id = ? OR conversations.receiver_id = ?)", user.id, user.id)
    end
    
    scope :between, -> (sender_id, receiver_id) do
        where(author_id: sender_id, receiver_id: receiver_id).or(where(author_id: receiver_id, receiver_id: sender_id)).limit(1)
    end

    def with(current_user)
        author == current_user ? receiver : author
    end

    def participates?(user)
        author == user || receiver == user
    end

end
